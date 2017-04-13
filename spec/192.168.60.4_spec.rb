require 'spec_helper'

describe 'has shared core utils' do
  include_examples 'core-utils::init'
end

describe file('/etc/hosts') do
  it { should be_file }
  it { should contain '192.168.60.5 fat10store.projectepic.net' }
end

describe user('bastion') do
  it { should exist }
end
