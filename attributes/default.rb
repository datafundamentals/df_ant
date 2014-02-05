default['df_ant']['url'] = "http://apache.osuosl.org//ant/binaries/apache-ant-1.9.3-bin.tar.gz"

case node['platform_family']
when "debian", "ubuntu"
	node.default['path_file'] = "/home/vagrant/.profile"
when "rhel", "centos"
	node.default['path_file'] = "/home/vagrant/.bash_profile"
end