#
# Cookbook:: codenamephp_php
# Recipe:: 7_2
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe '::add_sury_repository'

package 'install php7.2 from package' do
  package_name node['codenamephp_php']['7.2']['package_name']['cli']
end

if node['codenamephp_php']['install_apache'] == true
  include_recipe 'codenamephp_apache2'

  package 'install apache php modules' do
    package_name node['codenamephp_php']['7.2']['package_name']['apache']
  end
end

node['codenamephp_php']['7.2']['additional_packages'].each do |additional_package|
  package "install additional package #{additional_package}" do
    package_name additional_package
  end
end

include_recipe '::composer' if node['codenamephp_php']['install_composer']