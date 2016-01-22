require 'spec_helper'

describe 'epel', :type => 'class' do

  context "RH 5" do
    let :facts do
    {
      :osfamily => 'RedHat',
      :operatingsystemrelease => '5.1'
    }
    end

    it {
      should contain_package('epel-release')
    }
  end

  context "RH 6" do
    let :facts do
    {
      :osfamily => 'RedHat',
      :operatingsystemrelease => '6.1'
    }
    end

    it {
      should contain_package('epel-release')
    }
  end

  context "RH 7" do
    let :facts do
    {
      :osfamily => 'RedHat',
      :operatingsystemrelease => '7.1'
    }
    end

    it {
      should contain_package('epel-release')
    }
  end

  context "unsupported OS" do
    let :facts do
    {
      :osfamily => 'Darwin',
    }
    end

    it {
      expect { should raise_error(Puppet::Error) }
    }
  end
end
