class telegraf::confd::puppetagent {

    telegraf::confd { 'plugins.puppetagent':
        section    => 'plugins',
        subsection => 'puppetagent',
        subsection_conf => {
            location => "\"/var/lib/puppet/state/last_run_summary.yaml\"",
        },
    }

}
