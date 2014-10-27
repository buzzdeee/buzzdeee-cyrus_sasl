require 'spec_helper'
describe 'cyrus_sasl' do

  context 'with defaults for all parameters' do
    it { should contain_class('cyrus_sasl') }
  end
end
