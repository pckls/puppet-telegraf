define telegraf::confd (
    String $priority        = '50',
    String $section         = undef,
    Hash   $section_conf    = {},
    String $subsection      = '',
    Hash   $subsection_conf = {},
    Hash   $tagdrop         = {},
    Hash   $tagpass         = {},
) {
    include telegraf::params
    $config_path        = $telegraf::params::config_path
    $package_name       = $telegraf::params::package_name
    $title_minus_spaces = regsubst($title, '[ /:]', '_','G')

    file { "${config_path}/${priority}-${title_minus_spaces}.conf":
        ensure  => file,
        content => epp("${module_name}${config_path}/confd.conf.epp", {
            'section'         => $section,
            'section_conf'    => $section_conf,
            'subsection'      => $subsection,
            'subsection_conf' => $subsection_conf,
            'tagdrop'         => $tagdrop,
            'tagpass'         => $tagpass,
        }),
        notify  => Service[$package_name],
    }

}
