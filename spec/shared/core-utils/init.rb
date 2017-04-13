shared_examples 'core-utils::init' do

  describe package('git') do
    it { should be_installed }
  end

  describe package('curl') do
    it { should be_installed }
  end

end
