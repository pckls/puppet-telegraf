class telegraf (
    String $package_source = undef,
    String $urls           = undef,
) inherits telegraf::params {

    case $package_source {
        default: {
            package { $package_name:
                ensure => installed,
            }
        }
        'web': {
            ensure_packages(['wget'])

            exec { 'Download Telegraf Package':
                command => "wget ${package_url} -P /tmp",
                creates => "/tmp/${source}",
                path    => '/usr/local/bin/:/bin/',
                require => Package['wget'],
            }

            package { $package_name:
                ensure   => installed,
                provider => $provider,
                require  => Exec['Download Telegraf Package'],
                source   => "/tmp/${source}",
            }
        }
    }

    file { $config_file:
        ensure  => file,
        source  => "puppet:///modules/${module_name}${config_file}",
        require => Package[$package_name],
    }

    file { $config_path:
        ensure  => directory,
        purge   => true,
        recurse => true,
        require => Package[$package_name],
    }

    service { $package_name:
        ensure    => running,
        enable    => true,
        require   => Package[$package_name],
        subscribe => File[$config_file],
    }

}
