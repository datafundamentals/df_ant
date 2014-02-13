directory "/etc/profile.d" do 
	mode "0755" 
end
file "/etc/profile.d/ant.sh" do 
	content "export ANT_HOME=/usr/local/ant/apache-ant-1.9.3"
	owner "root" 
	action :create
end