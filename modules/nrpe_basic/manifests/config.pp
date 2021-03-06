class nrpe_basic::config {


	##### This file needs to be moved to the
	##### nrpe_base module, but since that
	##### module affects all hosts (both 
	##### testing and prod, additional 
	##### validation of the file is needed.
	##### When it's clear that it works 
	##### everywhere,this stanza can be moved.

	file { [ "/etc/nagios/localconf.d",
   		 "/etc/nagios/configs-available" ] :
		ensure => "directory",
		owner  => "nagios",
		group  => "nagios",
		mode   => 750,
	}



File {

		ensure  => present,
                owner   => 'nagios',
                group   => 'nagios',
                mode    => 0640,		
	        require => Class['nrpe_basic::packages'],
                notify  => Class['nrpe_basic::service'],
        }

	file { "/etc/nagios/nrpe.cfg":
                source  => "puppet:///modules/nrpe_localconf/nrpe.cfg",
        }
	
        file { "/etc/nagios/configs-available/disks.cfg":
		source	=> "puppet:///modules/nrpe_localconf/disks.cfg",
	}

	file { "/etc/nagios/configs-available/hadoop.cfg":
		source	=> "puppet:///modules/nrpe_localconf/hadoop.cfg",
	}

	file { "/etc/nagios/configs-available/system.cfg":
		source	=> "puppet:///modules/nrpe_localconf/system.cfg",
	}

	file { "/etc/nagios/configs-available/system-had.cfg":
		source	=> "puppet:///modules/nrpe_localconf/system-had.cfg",
	}

	file { "/etc/nagios/configs-available/http-frontend.cfg":
		source	=> "puppet:///modules/nrpe_localconf/http-frontend.cfg",
	}

	file { "/etc/nagios/configs-available/mgmt.cfg":
		source	=> "puppet:///modules/nrpe_localconf/mgmt.cfg",
	}

	file { "/etc/nagios/configs-available/check_puppet_run.cfg":
		ensure 	=> absent,
	}

	file { "/etc/nagios/configs-available/check_mcollective.cfg":
		ensure 	=> absent,
	}

}
