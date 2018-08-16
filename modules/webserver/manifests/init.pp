class webserver {
	package { 'httpd':
		ensure => present
	}

	file { '/etc/httpd/conf/httpd.conf':
		ensure => file,
		source => 'puppet:///modules/webserver/httpd.conf'
	}

	file { '/etc/httpd/conf.d/vhost.conf':
		ensure => file,
		content => template('webserver/vhost.conf.erb')
	}

	service { 'httpd' :
		ensure => running,
		enable => true,
		hasrestart => true
	}
}
