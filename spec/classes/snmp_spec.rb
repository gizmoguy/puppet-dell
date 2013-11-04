require 'spec_helper'

describe 'dell::snmp', :type => :class do
  context "activate dataeng snmp" do
    let( :facts ) {{
      :osfamily        => 'Debian',
      :operatingsystem => 'Debian',
    }}

    it do
      should contain_exec('activate omsa snmp').with({
        'command' => '/etc/init.d/dataeng enablesnmp',
        'notify'  => 'Service[dataeng]'
      })
    end
  end
end
