class telegraf::confd::cpu {

    telegraf::confd { 'plugins.cpu':
        section         => 'plugins',
        subsection      => 'cpu',
        subsection_conf => {
            percpu   => true,
            totalcpu => true,
            drop     => "[\"cpu_time\"]"
        },
    }

}
