require 'serverspec'
include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS


describe file('/usr/local/ant') do 
	it { should be_directory}
end

