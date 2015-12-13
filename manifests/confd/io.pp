class telegraf::confd::io {

    telegraf::confd { 'plugins.io':
        section    => 'plugins',
        subsection => 'io',
    }

}
