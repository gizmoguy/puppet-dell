node default {
  # used by classes/defines specs
}

node 'with_dell_openmanage' {
  include 'dell'
  include 'dell::openmanage'
}

node 'with_dell_hwtools' {
  include 'dell'
  include 'dell::hwtools'
}

node 'with_collectd' {
  include 'collectd'
  include 'dell::collectd'
}
