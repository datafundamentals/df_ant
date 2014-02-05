# df_ant cookbook
this is used to setup and install the cookbook to properly work with everybody
# Requirements
it must be able to work on a CentOS server 6.4 or higher. compatibility for secondary systems is an afterthought.
# Usage
if you are already using berkshelf and don't have a recipe this should automatically pull down and install the Java. otherwise you will have to download the java cookbook, or install it manually (but why would you do that?). in the ant documentation it says it was designed to work best with openJDK and not oracle. I have installed oracle and it seems to work fine, but no guarantees.

key points that you might want to change are both the installation location for the inital remote_file resource, which will require you to change the path location in the set_ant_home recipe, and will affect the path for the other resources

# Attributes
dev/server for CentOS and a base recipe

* default ['df_ant']['url']: the site where the rpm can be downloaded for installation.

# Recipes
this will require a base run of Java before ant will work

* default: this is the default recipe for the installation of ant. it will do the downloading and installation
* set_ant_home: this is a separate recipe that sets ANT_HOME. This was created in order to remove clutter from the default recipe


# Author

Author:: Jeff Carapetyan (<YOUR_EMAIL>)
