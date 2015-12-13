class telegraf::confd::agent {

    telegraf::confd { 'agent':
        section      => 'agent',
        section_conf => {
            interval       => "\"10s\"",
            round_interval => true,
            flush_interval => "\"10s\"",
            flush_jitter   => "\"0s\"",
            debug          => false,
            hostname       => "\"\"",
        },
    }

}
