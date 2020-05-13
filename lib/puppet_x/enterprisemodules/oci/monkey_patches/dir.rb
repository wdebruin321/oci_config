# frozen_string_literal: true

#
# Dir.home is used in the sdk, but will fail when run as a service. That's
# why we monley patch our own implementation here that will NOT fail when run as
# a service. We patch it before requiring oci, because it is used in constants
#
class Dir
  def self.home
    Etc.getpwuid(Process.uid).dir
  end
end
