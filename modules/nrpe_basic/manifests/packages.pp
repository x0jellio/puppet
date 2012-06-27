class nrpe_basic::packages {



if $lsbmajdistrelease == "6" {

      package { [ 
                   "nagios-plugins",
                   "nrpe", ] :
    
		ensure => installed, 
}
} elsif $lsbmajdistrelease == "5" {


package { [  
                
                  "nagios-plugins",
                   "nagios-nrpe", ] :
    
                ensure => installed,
	}
				}

}
