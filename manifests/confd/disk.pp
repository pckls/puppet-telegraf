class telegraf::confd::disk {

    telegraf::confd { 'plugins.disk':
        section    => 'plugins',
        subsection => 'disk',
    }

}
