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
include_recipe "java::default"

# download an ant binary
remote_file "/home/vagrant/apache-ant-1.9.3-bin.tar.bz2" do 
	source node['df_ant']['source']
	owner "root" 
	group "root"
	mode "0755" 
	action :create_if_missing
end

# unzip said binary
execute "unzip_file" do 
	cwd "/home/vagrant" 
	command "tar -xzvf apache-ant-1.9.3-bin.tar.bz2" 
	action :run
end

# make sure your JAVA_HOME and ANT_HOME is properly set and that ANT_HOME is in your path
include_recipe "df_ant::set_ant_home"

# setting ant path
# node['path_file'] is in the attributes
file node['path_file'] do 
	new_lines = "export PATH=$PATH:$ANT_HOME/bin"
	only_if do
		current_content = File.read("#{node['path_file']}")
		current_content.index("ANT_HOME").nil?
	end

	current_content = File.read("#{node['path_file']}")
	new_content = current_content + new_lines
	content "#{new_content}\n"
end

# get the library dependencies for ant