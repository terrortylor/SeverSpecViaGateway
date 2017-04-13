require 'spec_helper'

describe 'has shared core utils' do
  include_examples 'core-utils::init'
end

describe user('jenkins') do
  it { should exist }
end
