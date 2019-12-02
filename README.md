# Lets Play Atl

# Release Notes
Version 1.0 of the flutter application, Let's Play ATL. This version includes Google maps integration, the ability to create and modify events, a separation between citizens and organizers, and the ability to tag and search for events. There are no known bugs. The next version will include notifications, a screen for feedback to event organizers, and a potential scavenger hunt feature for users.

# Install Guide: Let’s Play ATL v1.0
# PRE-REQUISITES
You must have the Flutter SDK installed (see https://flutter.dev/docs/get-started/install) along with Android Studio. Setup a server with a connection to a MySQL dataset.
# DEPENDENCIES
Download and install Flask (see http://flask.palletsprojects.com/en/1.1.x/installation/#installation)
The list of dependencies for Flask are in the pubspec.yaml file.
 
For the serverside use the env.yaml file. Install conda and use the following commands on a server with an open connection to the internet or with a connection to a router connected to the internet.
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
 ./Miniconda3-latest-Linux-x86_64.sh -b
 conda env create -f env.yaml
# DOWNLOAD
	https://github.com/techlanta/LetsPlayAtl/archive/master.zip
	https://github.com/techlanta/LetsPlayATLServer/archive/v1.0.zip
# BUILD
	No build necessary.
# RUNNING APPLICATION
  Use Android or iPhone with Android Studio or with XCode
	Any text editor (see https://flutter.dev/docs/get-started/editor)
