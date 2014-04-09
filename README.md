# df_ant cookbook
this is used to setup and install the cookbook to properly work with everybody
# Requirements

* NOTE1: This cookbook (along with almost all dataFundamentals cookbooks) requires that you have local binaries to install other programs. If you are looking to use these as is, download the df_base cookbook to pull all the repositories. If you are looking to only pull certain binaries, please select the install flavor you would like in the attributes. The only one currently available is for Maven
*NOTE2: Please look at the .kitchen.yml file and adjust the synced folder from what we have run or it won't work
it must be able to work on a CentOS server 6.4 or higher. compatibility for secondary systems is an afterthought.

This is designed to work using a local binary. the one for this cookbook is located at docs.datafundamentals.com/lib

# Usage
if you are already using berkshelf and don't have a recipe this should automatically pull down and install the Java. otherwise you will have to download the java cookbook, or install it manually (but why would you do that?). in the ant documentation it says it was designed to work best with openJDK and not oracle. I have installed oracle and it seems to work fine, but no guarantees.

key points that you might want to change are both the installation location for the inital remote_file resource, which will require you to change the path location in the set_ant_home recipe, and will affect the path for the other resources

**NOTE** You should pay attention to the .kitchen.yml file in the synced folders section. We have it set up to pull from local binaries on the machine. If you try to run it out of the box it will fail.

# Attributes
dev/server for CentOS and a base recipe

* default ['df_ant']['url']: the site where the rpm can be downloaded for installation.

* case node ['platform_family']: this is a case statement written in to account for the differences altering paths in ubuntu vs. centos. This is not pretty, but effectively serves its purpose.

# Recipes
this will require a base run of Java before ant will work

* default: this is the default recipe for the installation of ant. it will do the downloading and installation
* set_ant_home: this is a separate recipe that sets ANT_HOME. This was created in order to remove clutter from the default recipe


# Author

Author:: Jeff Carapetyan (<jeff@datafundamentals.com>)
