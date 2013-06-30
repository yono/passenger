#
# Cookbook Name:: passenger
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "rbenv::system"
rbenv_ruby node["rbenv"]["global"]
rbenv_global node["rbenv"]["global"]

rbenv_gem "passenger" do
  version node["passenger"]["version"]
end

include_recipe "build-essential"
%(libcurl4-openssl-dev apache2-prefork-dev libapr1-dev libaprutil1-dev).each do |package_name|
  package package_name
end

rbenv_script "passenger_module" do
  conf_path = node["passenger"]["apache2"]["conf"]
  code <<-CODE
    passenger-install-apache2-module --auto
    rm -f #{conf_path}
    echo LoadModule passenger_module `passenger-config --root`/libout/apache2/mod_passenger.so >> #{conf_path}
    echo PassengerRoot `passenger-config --root` >> #{conf_path}
    echo PassengerDefaultRuby `rbenv which ruby` >> #{conf_path}
  CODE
  not_if { File.exists?(conf_path) }
end
