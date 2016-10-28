#
# Cookbook Name:: my-first-cookbook
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package 'apache2' do
  action :install
end

package 'unzip' do
  action :install
  version 'version 6.0-9ubuntu1.5'
end

cookbook_file '/var/www/html/index.html' do
  action :create
  owner 'www-data'
  group 'www-data'
end

directory '/var/www/html/images' do
  action :create
  owner 'www-data'
  group 'www-data'
  mode '0755'
end

directory '/opt/opsSchool' do
  action :create
  owner 'www-data'
  group 'www-data'
  mode '0755'
end

cookbook_file '/var/www/html/images/opsSchool.png' do
  action :create
  owner 'www-data'
  group 'www-data'
end

cookbook_file '/opt/opsSchool/HomeWork0_file' do
  action :create
  owner 'www-data'
  group 'www-data'
end

service 'apache2' do
  action [:start, :enable]
end
