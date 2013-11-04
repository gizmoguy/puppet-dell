require 'spec_helper'

describe 'with_dell_openmanage' do
  context "every distro" do
    ['Debian', 'RedHat'].each do |os|
      let( :facts ) {{
        :osfamily               => os,
        :operatingsystem        => os,
      }}

      it {should contain_service('dataeng').with_ensure('running')}
      it {should contain_file('/etc/logrotate.d/openmanage').with_ensure('present')}
      it {should contain_file('/etc/logrotate.d/perc5logs').with_ensure('absent')}
    end
  end

  context "debian wheezy" do
    let( :facts ) {{
      :osfamily               => 'Debian',
      :operatingsystem        => 'Debian',
      :operatingsystemrelease => '7.0',
      :lsbdistcodename        => 'wheezy'
    }}

    it {should contain_class('dell::openmanage::debian')}

    it {should contain_apt__source('dell-omsa').with_location('http://linux.dell.com/repo/community/debian')}
    it {should contain_package('srvadmin-base').with_ensure('present')}
    it {should contain_package('srvadmin-storageservices').with_ensure('present')}
    it {should contain_package('srvadmin-omcommon').with_ensure('present')}
  end

  context "debian squeeze" do
    let( :facts ) {{
      :osfamily               => 'Debian',
      :operatingsystem        => 'Debian',
      :operatingsystemrelease => '6.0',
      :lsbdistcodename        => 'squeeze',
      :omsa_version           => 'OMSA_6.5'
    }}

    it {should contain_class('dell::openmanage::debian')}

    it {should contain_apt__source('dell-omsa').with_location('http://linux.dell.com/repo/community/deb/OMSA_5.4')}
    it {should contain_package('srvadmin-base').with_ensure('present')}
    it {should contain_package('srvadmin-storageservices').with_ensure('present')}
  end

  context "debian lenny" do
    let( :facts ) {{
      :osfamily               => 'Debian',
      :operatingsystem        => 'Debian',
      :operatingsystemrelease => '5.0',
      :lsbdistcodename        => 'lenny'
    }}

    it {should contain_class('dell::openmanage::debian')}

    it {should contain_apt__source('dell-omsa').with_location('ftp://ftp.sara.nl/pub/sara-omsa')}
    it {should contain_package('dellomsa').with_ensure('present')}
  end

  context "centos" do
    let( :facts ) {{
      :osfamily               => 'RedHat',
      :operatingsystem        => 'CentOS',
      :operatingsystemrelease => '6.4',
    }}

    it {should contain_class('dell::openmanage::redhat')}
  end
end
