#
# Install the required gem
#
class oci_config(
  String[1]            $version,
  Stdlib::Absolutepath $tmp_dir,
){
  $source_file = "${tmp_dir}/oci-${version}.gem"
  if $::oci_installed_gem != $version {
    file {$source_file:
      ensure => 'present',
      source => "puppet:///modules/oci_config/oci-${version}.gem",
    }

    -> package {'oci':
      ensure   => $version,
      provider => 'puppet_gem',
      source   => $source_file,
    }

    -> exec {'cleanup gem source':
      command => "/bin/rm -f ${source_file}"
    }
  }

}
