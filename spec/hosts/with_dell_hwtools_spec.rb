require 'spec_helper'

describe 'with_dell_hwtools' do
  context "debian wheezy" do
    let( :facts ) {{
      :osfamily               => 'Debian',
      :operatingsystem        => 'Debian',
      :operatingsystemrelease => '7.0',
      :lsbdistcodename        => 'wheezy'
    }}

    it do
      should contain_package('smbios-utils').with({
        'ensure' => 'latest',
      })
    end
  end

  context "debian lenny" do
    let( :facts ) {{
      :osfamily               => 'Debian',
      :operatingsystem        => 'Debian',
      :operatingsystemrelease => '5.0',
      :lsbdistcodename        => 'lenny'
    }}

    it do
      should contain_package('libsmbios-bin').with({
        'ensure' => 'latest',
      })
    end
  end

  context "centos" do
    let( :facts ) {{
      :osfamily               => 'RedHat',
      :operatingsystem        => 'CentOS',
      :operatingsystemrelease => '6.4',
    }}

    it { should contain_package('libsmbios').with_ensure('latest') }
    it { should contain_package('smbios-utils').with_ensure('latest') }
    it { should contain_package('firmware-tools').with_ensure('latest') }

    it { should contain_file('/etc/pki/rpm-gpg/RPM-GPG-KEY-dell').with_ensure('present') }
    it { should contain_file('/etc/pki/rpm-gpg/RPM-GPG-KEY-libsmbios').with_ensure('present') }

    it { should contain_file('/etc/yum.repos.d/dell-omsa-indep.repo').with_ensure('present') }
    it { should contain_file('/etc/yum.repos.d/dell-software-repo.repo').with_ensure('absent') }

    it { should contain_yumrepo('dell-omsa-indep').with_enabled('1') }
  end
end
