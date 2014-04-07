#
# Cookbook Name:: df_ant
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#

# general case statements for the path editing


# standard setup of the and cookbook is as follows
# make sure that java is downloaded and installed before an ant install

# this might need the openjdk over oracle for ease of use
include_recipe "df_java::default"

directory "/usr/local/ant" do 
	user "root"
	mode "0755"
	recursive true
	action :create
end
# download an ant binary
remote_file "/usr/local/ant/apache-ant-1.9.3-bin.tar.gz" do 
	source node['df_ant']['source']
	owner "root" 
	group "root"
	mode "0755" 
	action :create_if_missing
end

# unzip said binary
execute "unzip_file" do 
	cwd "/usr/local/ant" 
	command "tar -xzvf apache-ant-1.9.3-bin.tar.gz" 
	action :run
end

# make sure your JAVA_HOME and ANT_HOME is properly set and that ANT_HOME is in your path
include_recipe "df_ant::set_ant_home"

# get the library dependencies for ant