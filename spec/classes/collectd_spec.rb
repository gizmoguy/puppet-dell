require 'spec_helper'

describe 'dell::collectd', :type => :class do
  context "setup collectd without puppet module" do
    let( :facts ) {{
      :osfamily => 'Debian',
      :operatingsystem => 'Debian',
      :lsbdistcodename => 'jessie',
      :servername => 'debian',
    }}
    it do
      should contain_file('collectd-dell.conf').with({
        'path'   => '/var/lib/puppet/modules/collectd/plugins/dell.conf',
        'mode'   => '0644',
        'owner'  => 'root',
        'notify' => 'Service[collectd]',
      })
    end
  end
end
