class windowspackages (
  $url           = 'http://chocolatey.org/api/v2/package/chocolatey/',
  $unzip         = '7za',
  $download_path = 'c:\\Windows\\Temp\\',
) {

  include windowspackages::packages
  include windowspackages::absent

  validate_re($unzip, '^(7za|windows)$')

  file { 'chocolatey script':
    path               => "${download_path}\\InstallChocolatey.ps1",
    source             => 'puppet:///modules/windowspackages/InstallChocolatey.ps1',
    source_permissions => 'ignore',
  }

  exec { 'install chocolatey':
    command     => "& '${download_path}\\InstallChocolatey.ps1' $url $unzip",
    provider    => powershell,
    subscribe   => File['chocolatey script'],
    refreshonly => true,
    timeout     => 1500,
    before      => Package['7zip.commandline'],
  }

  reboot { 'after':
      subscribe => Exec['install chocolatey'],
  }
} 
