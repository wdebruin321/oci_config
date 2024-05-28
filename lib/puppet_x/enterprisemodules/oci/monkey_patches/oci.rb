# frozen_string_literal: true

module OCI
  # The base API client which contains functionality make requests and receive responses from OCI
  # services. This client also handles request serialization and response deserialization
  #
  # We would like a client without paging. So we override the basic functionality of the web client class
  # to do multiple calls and only return when all data is available.
  #
  class ApiClient
    def call_api(http_method, path, endpoint, opts, &block)
      http_method = http_method.to_sym.downcase

      if http_method != :get
        return call_api_inner(http_method, path, endpoint, opts, &block) unless using_refresh_eligible_signer?

        return instance_principals_signer_wrapped_call do
          call_api_inner(http_method, path, endpoint, opts, &block)
        end
      end

      # Wrap get calls in a lambda that can be called later for paging
      # and wait_until.
      proc = lambda { |page|
        unless page.nil?
          opts[:query_params] ||= {}
          opts[:query_params][:page] = page
          opts[:query_params][:start] = page if opts[:return_type] == 'OCI::ObjectStorage::Models::ListObjects'
        end

        call_api_inner(http_method, path, endpoint, opts, &block)
      }
      next_page = nil
      agregated_data = []
      agregated = false
      while true
        response = proc.call(next_page) unless using_refresh_eligible_signer?
        response = instance_principals_signer_wrapped_call { proc.call(next_page) } if using_refresh_eligible_signer?
        break unless response.data.is_a?(Array)

        agregated_data += response.data
        break if response.next_page.nil?

        agregated = true
        next_page = response.next_page
      end

      if agregated
        #
        # Build a new response if we have agregated data
        #
        response = Response.new(response.status, response.headers, agregated_data)
      end
      response.api_call = proc
      response
    end
  end
end
