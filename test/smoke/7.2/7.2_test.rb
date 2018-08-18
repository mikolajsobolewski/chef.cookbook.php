# Inspec test for recipe codenamephp_php::7_2

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

control 'php-7.2-1.0' do
  title 'Make sure php7.2 is intsalled'
  desc 'Install php7.2 and apache2'

  describe package('php7.2') do
    it { should be_installed }
  end

  describe package('apache2') do
    it { should be_installed }
  end
end
