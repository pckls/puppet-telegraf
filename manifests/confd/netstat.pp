class telegraf::confd::netstat {

    telegraf::confd { 'plugins.netstat':
        section    => 'plugins',
        subsection => 'netstat',
    }

}
