#
# oci_config
#
# @summary Installs the required OCI GEM on the system.
#
# @param [String[1]] version
#    The version of the gem to install
#
# @param [Stdlib::Absolutepath] tmp_dir
#    The directory to use for temporary storing the gem file
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
      install_options => '--no-doc'
    }

    -> exec {'cleanup gem source':
      command => "/bin/rm -f ${source_file}"
    }
  }

}
