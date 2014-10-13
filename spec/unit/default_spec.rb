require 'spec_helper'

describe 'df_ant' do 
	let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe)}
	
	it 'should include the java recipe first' do 
		expect(chef_run).to include_recipe('df_java::default')
	end

	it 'should create the ant bin directory' do 
		expect(chef_run).to create_directory('/usr/local/ant').with(
			:user => 'root',
			:mode => '0755'
			)
	end
	it 'downloads the apache file as needed' do 
		expect(chef_run).to create_remote_file_if_missing('/usr/local/ant/apache-ant-1.9.3-bin.tar.gz').with(
			:user => 'root',
			:group => 'root',
			:mode => '0755'
			)
	end
	it 'should unzip the ant tar file ' do 
		expect(chef_run).to run_execute('tar -xzvf apache-ant-1.9.3-bin.tar.gz')
	end
	it 'will set ant in the environment variables' do 
		expect(chef_run).to include_recipe('df_ant::set_ant_home')
	end
		
end
