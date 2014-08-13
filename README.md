This is an example module to install and prepare a machine for chocolately, then install packages with it.

It does require a reboot of your system, and the following modules installed on your master with the following command:

/opt/puppet/bin/puppet module install puppetlabs/reboot
/opt/puppet/bin/puppet module install rismoney/chocolatey


