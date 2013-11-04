require 'spec_helper'

describe 'with_collectd' do
  context "setup collectd debian wheezy" do
    let( :facts ) {{
      :collectd_version       => 'hi',
      :concat_basedir         => 'dir',
      :osfamily               => 'Debian',
      :operatingsystem        => 'Debian',
      :operatingsystemrelease => '7.0',
      :lsbdistcodename        => 'wheezy'
    }}

    it do
      should contain_concat__fragment('collectd loadplugin snmp').with(
        :content => /LoadPlugin.+snmp/
      )
    end
  end

  context "setup collectd centos" do
    let( :facts ) {{
      :collectd_version       => 'hi',
      :concat_basedir         => 'dir',
      :osfamily               => 'RedHat',
      :operatingsystem        => 'CentOS',
      :operatingsystemrelease => '6.4',
    }}

    it do
      should contain_concat__fragment('collectd loadplugin snmp').with(
        :content => /LoadPlugin.+snmp/
      )
    end
  end
end
