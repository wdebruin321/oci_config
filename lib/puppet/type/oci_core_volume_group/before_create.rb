# frozen_string_literal: true

def before_create
  super
  @oci_api_data['source_details'] = {
    'type' => 'volumeIds',
    'volume_ids' => resolver.name_to_ocid(tenant, self[:volumes], :volume)
  }
end
