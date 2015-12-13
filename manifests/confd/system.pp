class telegraf::confd::system {

    telegraf::confd { 'plugins.system':
        section    => 'plugins',
        subsection => 'system',
    }

}
