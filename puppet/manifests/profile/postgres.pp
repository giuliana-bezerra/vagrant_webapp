class profile::postgres (
  $db_user,
  $db_password,
  $database,
  $init_script
) {
  $user      = $postgresql::server::user
  $group     = $postgresql::server::group
  $psql_path = $postgresql::server::psql_path
  $port      = $postgresql::server::port

  class { 'postgresql::server': } ->
  postgresql::server::role { $db_user:
    password_hash => postgresql_password($db_user, $db_password)
  } ->
  postgresql::server::db { $database:
    user     => $db_user,
    password => postgresql_password($db_user, $db_password)
  } ->
  postgresql::server::database_grant { $database:
    privilege => 'ALL',
    db        => $database,
    role      => $db_user
  } ->
  # Initialization script
  postgresql_psql { 'sql':
    db         => $database,
    psql_user  => $user,
    psql_group => $group,
    psql_path  => $psql_path,
    port       => $port,
    command    => $init_script,
    require    => Class['postgresql::server']
  }
}
