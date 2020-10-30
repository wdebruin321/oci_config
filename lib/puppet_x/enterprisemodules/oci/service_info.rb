# frozen_string_literal: true

require 'yaml'

module Puppet_X
  module EnterpriseModules
    module Oci
      # Docs
      class ServiceInfo
        #
        # The indexes in the information array
        #
        PUPPET_TYPE   ||= 0
        OCI_TYPE      ||= 1
        SDK_MODEL     ||= 2
        SDK_CLIENT    ||= 3
        LOOKUP_METHOD ||= 4

        # rubocop: disable Layout/LineLength
        @information = [
          # Puppet type name                            OCI identity type            SDK Model name                                     SDK Client                                Resource lookup method
          #==============================================================================================================================================================================================
          [:oci_budget_budget,                          :budget,                    'OCI::Budget::Models::Budget',                        'OCI::Budget::BudgetClient',                :compartment],
          [:oci_core_app_catalog_subscription,          :appcatalogsubscription,    'OCI::Core::Models::AppCatalogSubscription',          'OCI::Core::ComputeClient',                 :compartment],
          [:oci_core_boot_volume,                       :bootvolume,                'OCI::Core::Models::BootVolume',                      'OCI::Core::BlockstorageClient',            :availability_domains],
          [:oci_core_boot_volume_backup,                :bootvolumebackup,          'OCI::Core::Models::BootVolume',                      'OCI::Core::BlockstorageClient',            :compartment],
          [:oci_core_cpe,                               :cpe,                       'OCI::Core::Models::Cpe',                             'OCI::Core::VirtualNetworkClient',          :compartment],
          [:oci_core_cross_connect,                     :crossconnect,              'OCI::Core::Models::CrossConnect',                    'OCI::Core::VirtualNetworkClient',          :compartment],
          [:oci_core_cross_connect_group,               :crossconnectgroup,         'OCI::Core::Models::CrossConnectGroup',               'OCI::Core::VirtualNetworkClient',          :compartment],
          [:oci_core_dedicated_vm_host,                 :dedicatedvmhost,           'OCI::Core::Models::DedicatedVmHost',                 'OCI::Core::ComputeClient',                 :compartment],
          [:oci_core_dhcp_options,                      :dhcpoptions,               'OCI::Core::Models::DhcpOptions',                     'OCI::Core::VirtualNetworkClient',          :compartment],
          [:oci_core_drg,                               :drg,                       'OCI::Core::Models::Drg',                             'OCI::Core::VirtualNetworkClient',          :compartment],
          [:oci_core_image,                             :image,                     'OCI::Core::Models::Image',                           'OCI::Core::ComputeClient',                 :compartment],
          [:oci_core_instance,                          :instance,                  'OCI::Core::Models::Instance',                        'OCI::Core::ComputeClient',                 :compartment],
          [:oci_core_instance_console_connection,       :instanceconsoleconnection, 'OCI::Core::Models::InstanceConsoleConnection',       'OCI::Core::ComputeClient',                 :compartment],
          [:oci_core_internet_gateway,                  :internetgateway,           'OCI::Core::Models::InternetGateway',                 'OCI::Core::VirtualNetworkClient',          :compartment],
          [:oci_core_ip_sec_connection,                 :ipsecconnection,           'OCI::Core::Models::IPSecConnection',                 'OCI::Core::VirtualNetworkClient',          :compartment],
          [:oci_core_local_peering_gateway,             :localpeeringgateway,       'OCI::Core::Models::LocalPeeringGateway',             'OCI::Core::VirtualNetworkClient',          :compartment],
          [:oci_core_nat_gateway,                       :natgateway,                'OCI::Core::Models::NatGateway',                      'OCI::Core::VirtualNetworkClient',          :compartment],
          [:oci_core_network_security_group,            :networksecuritygroup,      'OCI::Core::Models::NetworkSecurityGroup',            'OCI::Core::VirtualNetworkClient',          :compartment],
          [:oci_core_remote_peering_connection,         :remotepeeringconnection,   'OCI::Core::Models::RemotePeeringConnection',         'OCI::Core::VirtualNetworkClient',          :compartment],
          [:oci_core_route_table,                       :routetable,                'OCI::Core::Models::RouteTable',                      'OCI::Core::VirtualNetworkClient',          :compartment],
          [:oci_core_security_list,                     :securitylist,              'OCI::Core::Models::SecurityList',                    'OCI::Core::VirtualNetworkClient',          :compartment],
          [:oci_core_service_gateway,                   :servicegateway,            'OCI::Core::Models::ServiceGateway',                  'OCI::Core::VirtualNetworkClient',          :compartment],
          [:oci_core_service,                           :service,                   'OCI::Core::Models::Service',                         'OCI::Core::VirtualNetworkClient',          :root],
          [:oci_core_subnet,                            :subnet,                    'OCI::Core::Models::Subnet',                          'OCI::Core::VirtualNetworkClient',          :compartment],
          [:oci_core_vcn,                               :vcn,                       'OCI::Core::Models::Vcn',                             'OCI::Core::VirtualNetworkClient',          :compartment],
          [:oci_core_virtual_circuit,                   :virtualcircuit,            'OCI::Core::Models::VirtualCircuit',                  'OCI::Core::VirtualNetworkClient',          :compartment],
          [:oci_core_volume,                            :volume,                    'OCI::Core::Models::Volume',                          'OCI::Core::BlockstorageClient',            :compartment],
          [:oci_core_volume_backup,                     :volumebackup,              'OCI::Core::Models::VolumeBackup',                    'OCI::Core::BlockstorageClient',            :compartment],
          [:oci_core_volume_backup_policy,              :volumebackuppolicy,        'OCI::Core::Models::VolumeBackupPolicy',              'OCI::Core::BlockstorageClient',            :root],
          [:oci_core_volume_group,                      :volumegroup,               'OCI::Core::Models::VolumeGroup',                     'OCI::Core::BlockstorageClient',            :compartment],
          [:oci_core_volume_group_backup,               :volume_group_backup,       'OCI::Core::Models::VolumeGroupBackup',               'OCI::Core::BlockstorageClient',            :compartment],
          [:oci_identity_compartment,                   :compartment,               'OCI::Identity::Models::Compartment',                 'OCI::Identity::IdentityClient',            :compartment],
          [:oci_identity_dynamic_group,                 :dynamicgroup,              'OCI::Identity::Models::DynamicGroup',                'OCI::Identity::IdentityClient',            :compartment],
          [:oci_identity_group,                         :group,                     'OCI::Identity::Models::Group',                       'OCI::Identity::IdentityClient',            :compartment],
          [:oci_identity_identity_provider,             :saml2idp,                  'OCI::Identity::Models::IdentityProvider',            'OCI::Identity::IdentityClient',            :protocol],
          [:oci_identity_policy,                        :policy,                    'OCI::Identity::Models::Policy',                      'OCI::Identity::IdentityClient',            :compartment],
          [:oci_identity_tag_namespace,                 :tagnamespace,              'OCI::Identity::Models::TagNamespace',                'OCI::Identity::IdentityClient',            :compartment],
          [:oci_identity_tag,                           :tagdefinition,             'OCI::Identity::Models::Tag',                         'OCI::Identity::IdentityClient',            :tag_namespace],
          [:oci_identity_tag_default,                   :tagdefault,                'OCI::Identity::Models::TagDefault',                  'OCI::Identity::IdentityClient',            :compartment_detailed],
          [:oci_identity_user,                          :user,                      'OCI::Identity::Models::User',                        'OCI::Identity::IdentityClient',            :compartment],
          [:oci_database_autonomous_database,           :autonomousdatabase,        'OCI::Database::Models::AutonomousDatabase',          'OCI::Database::DatabaseClient',            :compartment],
          [:oci_key_management_vault,                   :vault,                     'OCI::KeyManagement::Models::Vault',                  'OCI::KeyManagement::KmsVaultClient',       :compartment],
          [:oci_key_management_key,                     :key,                       'OCI::KeyManagement::Models::Key',                    'OCI::KeyManagement::KmsManagementClient',  :vault],
          [:oci_core_public_ip,                         :publicip,                  'OCI::Core::Models::PublicIp',                        'OCI::Core::VirtualNetworkClient',          :compartment],
          [:oci_core_instance_configuration,            :instanceconfiguration,     'OCI::Core::Models::InstanceConfiguration',           'OCI::Core::ComputeManagementClient',       :compartment_detailed],
          [:oci_core_instance_pool,                     :instancepool,              'OCI::Core::Models::InstancePool',                    'OCI::Core::ComputeManagementClient',       :compartment],
          [:oci_autoscaling_auto_scaling_configuration, :autoscalingconfiguration,  'OCI::Autoscaling::Models::AutoScalingConfiguration', 'OCI::Autoscaling::AutoScalingClient',      :compartment],
          [:oci_object_storage_bucket,                  :bucket,                    'OCI::ObjectStorage::Models::Bucket',                 'OCI::ObjectStorage::ObjectStorageClient',  :namespace],
          [:oci_file_storage_file_system,               :filesystem,                'OCI::FileStorage::Models::FileSystem',               'OCI::FileStorage::FileStorageClient',      :availability_domains],
          [:oci_file_storage_mount_target,              :mounttarget,               'OCI::FileStorage::Models::MountTarget',              'OCI::FileStorage::FileStorageClient',      :availability_domains],
          [:oci_file_storage_export,                    :export,                    'OCI::FileStorage::Models::Export',                   'OCI::FileStorage::FileStorageClient',      :compartment],
          [:oci_database_db_system,                     :dbsystem,                  'OCI::Database::Models::DbSystem',                    'OCI::Database::DatabaseClient',            :compartment],
          [:oci_database_db_node,                       :dbnode,                    'OCI::Database::Models::DbNode',                      'OCI::Database::DatabaseClient',            :db_systems],
          [:oci_database_database,                      :database,                  'OCI::Database::Models::Database',                    'OCI::Database::DatabaseClient',            :systems],
          #
          # Some OCI resource ID's we need
          #
          [:unknown,                                    :listing,                    'UNDEFINED',                                          'UNDEFINED',                               :compartment],
          [:unknown,                                    :resource,                   'UNDEFINED',                                          'UNDEFINED',                               :compartment],
          [:unknown,                                    :peer,                       'UNDEFINED',                                          'UNDEFINED',                               :compartment],
          [:unknown,                                    :tenancy,                    'UNDEFINED',                                          'UNDEFINED',                               :compartment],
          [:unknown,                                    :autonomouscontainerdatabase, 'UNDEFINED', 'UNDEFINED', :compartment],
          [:unknown,                                    :last_patch_history_entry,   'UNDEFINED',                                          'UNDEFINED',                               :compartment],
          [:unknown,                                    :scan_ip,                    'UNDEFINED',                                          'UNDEFINED',                               :compartment],
          [:unknown,                                    :vip,                        'UNDEFINED',                                          'UNDEFINED',                               :compartment],
          [:unknown,                                    :scan_dns_record,            'UNDEFINED',                                          'UNDEFINED',                               :compartment],
          [:unknown,                                    :db_home,                    'UNDEFINED',                                          'UNDEFINED',                               :compartment],
          [:unknown,                                    :vm_cluster,                 'UNDEFINED',                                          'UNDEFINED',                               :compartment],
          [:unknown,                                    :maintenancerun,             'UNDEFINED',                                          'UNDEFINED',                               :compartment],
          [:unknown,                                    :publicippool,               'UNDEFINED',                                          'UNDEFINED',                               :compartment],
          [:unknown,                                    :autonomous_exadata_infrastructure,
           'UNDEFINED', 'UNDEFINED', :compartment]
        ]
        # rubocop: enable Layout/LineLength

        def self.type_to_id(type)
          with_type_entry(type) { |e| e[OCI_TYPE] }
        end

        def self.type_to_class(type)
          with_type_entry(type) { |e| Object.const_get(e[SDK_MODEL]) }
        end

        def self.type_to_client(type)
          with_type_entry(type) { |e| Object.const_get(e[SDK_CLIENT]) }
        end

        def self.type_to_lookup_method(type)
          with_type_entry(type) { |e| e[LOOKUP_METHOD] }
        end

        def self.id_to_class(id)
          with_id_entry(id) { |e| Object.const_get(e[SDK_MODEL]) }
        end

        def self.id_to_type(id)
          with_id_entry(id) { |e| e[PUPPET_TYPE] }
        end

        def self.with_type_entry(type)
          entry = @information.find { |e| e[PUPPET_TYPE] == type }
          fail "Internal error: No information found for #{type}" if entry.nil?

          yield entry
        end

        def self.with_id_entry(id)
          entry = @information.find { |e| e[OCI_TYPE] == id }
          fail "Internal error: No information found for #{id}" if entry.nil?

          yield entry
        end
      end
    end
  end
end
