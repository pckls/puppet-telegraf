class telegraf::params {

    $package_location = 'https://s3.amazonaws.com/get.influxdb.org'
    $package_name     = 'telegraf'
    $package_version  = '0.2.4'

    case $::osfamily {
        default: {
            fail("${::osfamily} is not supported.")
        }
        'Debian': {
            $provider = 'deb'
            $source   = "${package_name}_${package_version}_amd64.deb"
        }
        'RedHat': {
            $provider = 'rpm'
            $source   = "${package_name}-${package_version}-1.x86_64.rpm"

        }
    }

    $config_file = '/etc/opt/telegraf/telegraf.conf'
    $config_path = '/etc/opt/telegraf/telegraf.d'
    $package_url = "${package_location}/${package_name}/${source}"

}
