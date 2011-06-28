class httpd::php {
	package { 'libapache2-mod-php5':
		ensure => latest
	}

	file { 'php.ini':
		path => '/etc/php5/apache2/php.ini',
		ensure => file,
		require => Package['libapache2-mod-php5'],
		source => 'puppet:///modules/httpd/files/php.ini',
		owner => 'root',
		group => 'root',
		mode => 644
	}
}