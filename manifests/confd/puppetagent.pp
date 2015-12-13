class telegraf::confd::puppetagent {

    telegraf::confd { 'plugins.puppetagent':
        section    => 'plugins',
        subsection => 'puppetagent',
        subsection_conf => {
            # TODO: Make this a variable
            location => "\"/var/lib/puppet/state/last_run_summary.yaml\"",
            #/opt/puppetlabs/puppet/cache/state/last_run_summary.yaml
        },
    }

}
