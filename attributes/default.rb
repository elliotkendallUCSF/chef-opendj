#
# Cookbook Name:: opendj
# Attributes:: default
#

default["opendj"]["version"] = "2.5.0-Xpress1"
default["opendj"]["install_dir"] = "/opt"
default["opendj"]["installer_archive"] = default["opendj"]["install_dir"] + "/OpenDJ-" + default["opendj"]["version"] + ".zip"
default["opendj"]["dsml_war"] = "OpenDJ-" + default["opendj"]["version"] + "-DSML.war"
default["opendj"]["home"] = default["opendj"]["install_dir"] + "/OpenDJ-" + default["opendj"]["version"]

default["opendj"]["sync_enabled"] = false
default["opendj"]["sync_user"] = "ldapsync"
default["opendj"]["sync_group"] = "ldapsync"
default["opendj"]["sync_dir"] = "/home/" + default["opendj"]["sync_user"]
default["opendj"]["sync_file"] = default["opendj"]["sync_dir"] + '/backup.ldif'
default["opendj"]["sync_keys"] = []

default["opendj"]["user"] = "opendj"
default["opendj"]["user_root_dn"] = "dc=foo,dc=com"
default["opendj"]["standard_port"] = "1389"
default["opendj"]["ssl_port"] = "1636"
default["opendj"]["admin_port"] = "4444"
default["opendj"]["ssl_cert"] = "keystore.crt"
default["opendj"]["ssl_key"] = "keystore.key"
default["opendj"]["ssl_chain"] = [ ]
default["opendj"]["keystore_pass"] = "badpass"
default["opendj"]["dir_manager_bind_dn"] = "cn=Directory Manager"
default["opendj"]["dir_manager_password"] = "badpass"
default["opendj"]["properties"] = {}
default["opendj"]["ldif_files"] = []
default["opendj"]["replication"]["host_search"] = 'role:sample-opendj-role'
default["opendj"]["replication"]["port"] = default["opendj"]["ssl_port"]
default["opendj"]["replication"]["uid"] = 'replication-user'
default["opendj"]["replication"]["password"] = 'badpass'

default["opendj"]["java_args"] = {
  "restore.online" => "-Xms8m -client",
  "dsreplication.offline" => "-server",
  "rebuild-index" => "-server",
  "dsconfig" => "-Xms8m -client",
  "dsframework" => "-Xms8m -client",
  "ldapdelete" => "-Xms8m -client",
  "backup.online" => "-Xms8m -client",
  "ldapcompare" => "-Xms8m -client",
  "restore.offline" => "-server",
  "manage-account" => "-Xms8m -client",
  "import-ldif.offline" => "-server",
  "ldappasswordmodify" => "-Xms8m -client",
  "verify-index" => "-server",
  "uninstall" => "-Xms8m -client",
  "dbtest" => "-server",
  "start-ds" => "-server",
  "setup" => "-Xms8m -client",
  "ldif-diff" => "-server",
  "export-ldif.online" => "-Xms8m -client",
  "ldifsearch" => "-server",
  "ldapmodify" => "-Xms8m -client",
  "ldifmodify" => "-server",
  "stop-ds" => "-Xms8m -client",
  "ldapsearch" => "-Xms8m -client",
  "status" => "-Xms8m -client",
  "manage-tasks" => "-Xms8m -client",
  "list-backends" => "-Xms8m -client",
  "upgrade" => "-server",
  "control-panel" => "-Xms64m -Xmx128m -client",
  "base64" => "-Xms8m -client",
  "encode-password" => "-server",
  "create-rc-script" => "-Xms8m -client",
  "backup.offline" => "-server",
  "make-ldif" => "-server",
  "export-ldif.offline" => "-server",
  "import-ldif.online" => "-Xms8m -client",
  "dsreplication" => "-Xms8m -client"
}
