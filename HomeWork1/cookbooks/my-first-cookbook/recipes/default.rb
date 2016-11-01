#
# Cookbook Name:: my-first-cookbook
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#
# Cookbook Name:: my-first-cookbook
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package 'libapache2-mod-wsgi' do
  action :install
end

package 'python-pip' do
  action :install
end

package 'python-mysqldb' do
  action :install
end

execute 'flask' do
	command 'pip install flask'
end
	
execute 'apachectl stop' do
	command 'apachectl stop'
end

cookbook_file '/etc/apache2/sites-enabled/AAR-apache.conf' do
  action :create
  owner 'root'
  group 'root'
end

cookbook_file '/var/www/AAR/AAR_config.py' do
  action :create
  owner 'root'
  group 'root'
end

cookbook_file '/tmp/make_AARdb.sql' do
  action :create
  owner 'root'
  group 'root'
end

execute 'make_AARdb' do
	command 'mysql -proot < /tmp/make_AARdb.sql'
end

execute 'CREATE USER' do
	command "mysql -proot -e \"CREATE USER 'aarapp'@'localhost' IDENTIFIED BY '7ERwzg7E'\""
end

execute 'permissions' do
	command "mysql -proot -e \"GRANT CREATE,INSERT,DELETE,UPDATE,SELECT on AARdb.* to aarapp@localhost\""
end

execute 'apachectl start' do
	command 'apachectl start'
end

