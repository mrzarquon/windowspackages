class windowspackages::packages {
  Package {
    ensure   => installed,
    provider => chocolatey,
  }

  $package_list = [
    'tightvnc',
    'Firefox',
    'GoogleChrome',
    'putty' ]

  package {'7zip.commandline': }

  package { $package_list: 
    require => Package['7zip.commandline'],
  }
}
