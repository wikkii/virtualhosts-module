define virtualhosts::vhost(){
	
	file { "/etc/apache2/sites-available/${title}.conf":
	content => template("virtualhosts/virtualhost.conf.erb"),
        }

	file { "/etc/apache2/sites-enabled/${title}.conf":
	ensure => "link",
	require => File["/etc/apache2/sites-available/${title}.conf"],	
	target => "../sites-available/${title}.conf",
	notify => Service["apache2"],	
	}	
}
