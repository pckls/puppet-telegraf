class telegraf::confd::influxdb (
    $urls = $telegraf::urls,
) {

    telegraf::confd { 'outputs.influxdb':
        section         => 'outputs',
        subsection      => 'influxdb',
        subsection_conf => {
            urls      => $urls,
            database  => "\"telegraf\"",
            precision => "\"s\"",
        },
    }

}
