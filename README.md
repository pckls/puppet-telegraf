# telegraf

## Module Description

[Telegraf](https://influxdata.com/time-series-platform/telegraf) is an open source agent for collecting metrics and data. Telegraf writes the collected data to InfluxDB. This module installs Telegraf and provides the ability to customise the configuration. This module aims to be generic and simple.

## Setup

*What the telegraf Puppet module affects:*

* Package installation
* Service management
* Configuration files

## Usage

The minimum configuration required is to provide the URL's of your InfluxDB server(s) and include some base config:

```
class { 'telegraf':
    urls => "[\"http://influxdb.example.org:8086\"]",
}
include telegraf::confd::agent
include telegraf::confd::cpu
include telegraf::confd::influxdb
include telegraf::confd::mem
```

This will simply call the package as a standard resource and thus assumes you have configured a repository that contains the package, be it your own or a third party. For most production environments this assumption should be appropriate as external access is often restricted.

If you do not have such restrictions and do not want to configure a repository you can simply request that the package be fetched from the internet:

```
class { 'telegraf':
    package_source => 'web',
    urls           => "[\"http://influxdb.example.org:8086\"]",
}
include telegraf::confd::agent
include telegraf::confd::cpu
include telegraf::confd::influxdb
include telegraf::confd::mem
```

### Hiera Support

It is recommended that Hiera is used, but not required. Below is an example configuration:

*site.pp*

```
hiera_include('classes', [])
```

*mynode.example.org.yaml*

```
clases:
    - telegraf
    - telegraf::confd::agent
    - telegraf::confd::cpu
    - telegraf::confd::influxdb
    - telegraf::confd::mem

telegraf::package_source: web
telegraf::urls: "[\"http://influxdb.example.org:8086\"]"
```

## Reference

### Classes

Class: `telegraf`

Guides the basic setup and installation of Telegraf on your system.

When this class is declared with the default options, Puppet:

* Installs the appropriate Telegraf software package for your operating system (assumes you have a repository configured).
* Places the required configuration files in a directory, with the default location determined by your operating system.
* Starts the Telegraf service and sets the service to run at boot.

*Paramters within `telegraf`:*

`package_source`
Determines how to install the package. Valid options: 'default', 'web'. Default: 'default'

`urls`
The URL's of your InfluxDB server(s), REQUIRED. Valid options: String. Default: undef

### Defined Types

Defined Type: `telegraf::confd`

Provides a way to include config fragments. Telegraf uses [TOML](https://github.com/toml-lang/toml) which is... interesting to use.

Some values need to be enclosed in quotes, other do not. I haven't thought of an easy way to deal with this yet, other than escaping quotation marks.

*Paramters within `telegraf::confd`:*

`priority`
A numerical prefix for ordering of config. Default: '50'

`section`
The name of the section you are configuring, REQUIRED. Valid options: 'agent', 'outputs', 'plugins', 'tags'. Default: undef

`section_conf`
A hash of the config options for the section. Default: {}

`subsection`
The name of the subsection you are configuring. Default: ''

`subsection_conf`
A hash of the config options for the subsection. Default: {}

`tagdrop`
A hash of the tagdrop config options for the subsection. Default: {}

`tagpass`
A hash of the tagpass config options for the subsection. Default: {}

## Limitations

### Puppet Future Parser

This module is written using features that are found in the future parser and is not backwards compatible.

## Development

### Contributing

Please feel free to fork this module, make the appropriate changes in a feature branch, and submit a pull request.

### Running Tests

TBD

## Acknowledgements

There are two other modules floating around which I initially drew inspiration from:

* https://github.com/ekini/puppet-telegraf
* https://github.com/rplessl/puppet-telegraf

This module has diverted significantly from their implementations.
