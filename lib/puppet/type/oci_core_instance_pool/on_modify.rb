# frozen_string_literal: true

def on_modify
  @oci_api_data[:placement_configurations] = nil
  super
end
