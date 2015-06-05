require 'spec_helper'
describe 'epel' do

  context 'with defaults for all parameters' do
    it { should contain_class('epel') }
  end
end
