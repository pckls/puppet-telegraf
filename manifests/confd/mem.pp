class telegraf::confd::mem {

    telegraf::confd { 'plugins.mem':
        section    => 'plugins',
        subsection => 'mem',
    }

}
