class ssh {
	package { 'ssh':
		ensure => latest,
	}

	service { 'ssh':
		ensure => running,
		enable => true,
		hasrestart => true,
		hasstatus => true,
		suscribe => File['sshd.conf'],
	}

	file { 'sshd.conf':
		path => '/etc/ssh/sshd_config',
		ensure => file,
		require => Package['ssh'],
		source => 'puppet:///modules/ssh/files/sshd_config',
		owner => 'root',
		group => 'root',
		mode => 644,
	}

	file { 'ssh_keys_rsa':
		path => '/etc/ssh/ssh_host_rsa_key',
		ensure => file,
		require => Package['ssh'],
		owner => 'root',
		group => 'root',
		mode => 600,
	}

	file { 'ssh_keys_dsa':
		path => '/etc/ssh/ssh_host_dsa_key',
		ensure => file,
		require => Package['ssh'],
		owner => 'root',
		group => 'root',
		mode => 600,
	}

	file { 'ssh_keys_rsa_pub':
		path => '/etc/ssh/ssh_host_rsa_key.pub',
		ensure => file,
		require => Package['ssh'],
		owner => 'root',
		group => 'root',
		mode => 644,
	}

	file { 'ssh_keys_dsa_pub':
		path => '/etc/ssh/ssh_host_dsa_key.pub',
		ensure => file,
		require => Package['ssh'],
		owner => 'root',
		group => 'root',
		mode => 644,
	}
}