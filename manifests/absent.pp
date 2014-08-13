class windowspackages::absent {
  Package {
    ensure => absent,
  }

  $blacklist = [
    'iTunes',
    'Safari',
    'MSN Messenger'
  ]

  package { $blacklist: }
}
