maintainer        "Elliot Kendall"
maintainer_email  "elliot.kendall@ucsf.edu"
license           "Apache 2.0"
description       "Installs OpenDJ LDAP server"
version           "0.1.2"
name              "opendj"

recipe "opendj", "Installs OpenDJ LDAP server"

%w{ redhat centos fedora ubuntu debian }.each do |os|
  supports os
end
