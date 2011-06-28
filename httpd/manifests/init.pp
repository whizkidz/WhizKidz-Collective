class httpd {
	package { 'apache2':
		ensure => latest
	}

	service { 'apache2':
		ensure => running,
		enable => true,
		hasrestart => true,
		suscribe => [ File['apache2.conf'],
		              File['ports.conf'] ]
	}

	file { 'apache2.conf':
		path => '/etc/apache2/apache2.conf',
		ensure => file
		require => Package['apache2'],
		source => 'puppet:///modules/httpd/files/apache2.conf',
		owner => 'root',
		group => 'root',
		mode => 644
	}

	file { 'ports.conf':
		path => '/etc/apache2/ports.conf',
		ensure => file,
		require => Package['apache2'],
		source => 'puppet:///modules/httpd/files/apache2.conf',
		owner => 'root',
		group => 'root',
		mode => 644
	}
}