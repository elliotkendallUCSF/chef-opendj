Description
===========

Installs the OpenDJ LDAP server

Requirements
============

Platform
--------

Tested and developed on CentOS

Attributes
==========

* `node["opendj"]["version"]` - The version of the software we're installing.
Should match the archive you place in files/default - see `Usage` below.

* `node['opendj']['install_dir']` - Where to unpack the software. Defaults
to `/opt`

* `node['opendj']['user']` - The user to run as. Defaults to `opendj`

* `node['opendj']['user_root_dn']` - The root DN of the directory. Defaults
to `dc=foo,dc=com`

* `node['opendj']['standard_port']` - The port to listen on for unencrypted
LDAP.  Defaults to `1389` because `389` wouldn't work on most platforms
unless we ran as root.

* `node['opendj']['ssl_port']` - The port to listen on for SSL-encrypted
LDAP.  Defaults to `1636` because `636` wouldn't work on most platforms
unless we ran as root.

* `node['opendj']['admin_port']` - The port to listen on for the admin
interface. Defaults to `4444`

* `node['opendj']['ssl_cert']` - A PEM format certificate to use for SSL
connections.  This file must be present in the files/default/ directory of
this cookbook.

* `node['opendj']['ssl_key']` - A PEM format private key to use for SSL
connections.  This file must be present in the files/default/ directory of
this cookbook.

* `node['opendj']['ssl_chain']` - A list of PEM format certificates
connecting our SSL certificate to its root CA.  The order should be moving
from the local certificate towards the root CA, e.g.  intermediate 2,
intermediate 1, root.  Each file must be present in the files/default/
directory of this cookbook.

* `node['opendj']['keystore_pass']` - The password for the keystore where
the SSL data is stored.  Defaults to `badpass`.  **Override this!**

* `node['opendj']['dir_manager_bind_dn']` - The bind DN for the directory
manager user. Defaults to `cn=Directory Manager`

* `node['opendj']['dir_manager_password']` - The password for the directory
manager user. Defaults to `badpass`. **Override this!**

* `node['opendj']['java_args']` - A dictionary of java classes and the
arguments to use to invoke Java for them. Populated with the defaults
from OpenDJ.

* `node['opendj']['properties']` - A dictionary of configuration properties
to set and their values.  The key is the XXX part of the set-XXX-prop
directive you'd use with dsconfig. The value is a dictionary with
two keys, `flags` and `set`.

The flags key's value is a dictionary. The key is the part that comes after
the -- in a command line option, and the value is the parameter each flag
takes.  The set key's value is a dictionary.  The keys is the name of the
property to set, and the value is what to set it to.

This is all pretty confusing, so it may be easiest to look at the example
under `Usage`, below.

* `node['opendj']['ldif_files']` - A list of ldif files to be loaded
into the directory when it's first configured. Each file must also be
added to the files/default/ directory of this cookbook.

* `node['opendj']['replication']['host_search']` - A chef search query which
returns the systems that are part of this system's replication cluster.

* `node['opendj']['replication']['uid']` - The name of the user to use
for replication.

* `node['opendj']['replication']['password']` - The the password to use for
the replication user. Defaults to `badpass`. **Override this!**

Usage
=====

Place the OpenDJ distribution zip file and matching DSML gateway war file in
the files/default directory of this cookbook.  Also place any LDIF files you
want to load in the same place.

Define at least the `user_root_dn` and `dir_manager_password` attributes. 
Here is an example of a configuration set defined as part of a role:

    {
      "name": "foo",
      ...
      "run_list": [
        ...
        "recipe[opendj]"
      ],
      "override_attributes": {
        ...
        "opendj": {
          "user_root_dn": "dc=ucsf,dc=edu",
          "indexes": [
            {
              "itypes": [ "equality", "substring" ],
              "attributes": {
                "displayName": "4000"
              }
            }
          ],
          "properties": {
            "global-configuration": {
              "set": {
                "disabled-privilege": "unindexed-search"
              }
            }
            "virtual-attribute": {
              "flags": {
                "name": "Virtual Static member"
              },
              "set": {
                "allow-retrieving-membership": "true"
              }
            },
          },
          "java_args": {
            "start-ds": "-server -Xms2g -Xmx2g",
            "rebuild-index": "-server -Xmx768m"
          },
          "ldif_files": ["schema.ldif" ]
        }
      }
    }

License and Author
==================

Author:: Elliot Kendall (<elliot.kendall@ucsf.edu>)

Copyright:: 2013, The Regents of the University of California
