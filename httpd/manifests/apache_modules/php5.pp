class httpd::apache_modules::php5 {
	$module = 'php5'

	file { 'modules_alias':
		path => '/etc/apache2/mods-available/${module}.conf',
		ensure => file,
		owner => 'root',
		group => 'root',
		require => Package['apache2']
	}

	file { 'modules_load':
		path => '/etc/apache2/mods-available/${module}.load',
		ensure => file,
		owner => 'root',
		group => 'root',
		require => Package['apache2']
	}

	file { 'modules_alias':
		path => '/etc/apache2/mods-enabled/${module}.conf',
		ensure => link,
		target => '/etc/apache2/mods-available/${module}.conf',
		owner => 'root',
		group => 'root',
		require => Package['apache2']
	}

	file { 'modules_load':
		path => '/etc/apache2/mods-enabled/${module}.load',
		ensure => link,
		target => '/etc/apache2/mods-available/${module}.conf',
		owner => 'root',
		group => 'root',
		require => Package['apache2']
	}
}