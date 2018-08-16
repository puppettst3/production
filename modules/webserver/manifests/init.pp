class webserver {
	if $::osfamily == 'RedHat' {
		package { 'httpd':
			ensure => present
		}	
	} elsif $::osfamily == 'Debian' {
		package { 'apache2':
			ensure => present
		}
	} else {
		notify { 'This distribution is not supported.' }
	}
}
