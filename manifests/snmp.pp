#
# == Class: dell::snmp
#
# Add a line to snmpd.conf which will publish Dell OMSA's infos through SNMP.
#
class dell::snmp {
  case $::operatingsystem {
    'Debian' : {
      exec {'activate omsa snmp':
        command => '/etc/init.d/dataeng enablesnmp',
        unless  => '/etc/init.d/dataeng getsnmpstatus | grep -qi enabled',
        notify  => Service['dataeng'],
      }
    }
    default: {}
  }
}
