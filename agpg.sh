#!/bin/sh
echo "AppGiraffe Project Manager v1.0 Copyright (c) 2013 AppGiraffe, LLC"

#check for ther correct parameters
#
# ag_project [project|plugins] [create|install|remove|delete] [package name|plugin name] [project name] [project folder]
#
#
#

#functions
install_appgiraffe_plugins(){
	phonegap local plugin add https://github.com/dferrell/plugins-orientation.git
	phonegap local plugin add https://github.com/dferrell/plugins-date-picker.git
	phonegap local plugin add https://github.com/dferrell/plugins-application-preferences.git
}

remove_appgiraffe_plugins(){
	phonegap local plugin remove com.appgiraffe.plugins.calendar
	phonegap local plugin remove com.appgiraffe.plugins.display
	phonegap local plugin remove com.appgiraffe.plugins.prefs
}


install_default_plugins(){
	#phonegap local plugin add https://git-wip-us.apache.org/repos/asf/cordova-plugin-battery-status.git
	#phonegap local plugin add https://git-wip-us.apache.org/repos/asf/cordova-plugin-camera.git
	#phonegap local plugin add https://git-wip-us.apache.org/repos/asf/cordova-plugin-console.git
	#phonegap local plugin add https://git-wip-us.apache.org/repos/asf/cordova-plugin-contacts.git
	#phonegap local plugin add https://git-wip-us.apache.org/repos/asf/cordova-plugin-device-motion.git
	#phonegap local plugin add https://git-wip-us.apache.org/repos/asf/cordova-plugin-device-orientation.git
	phonegap local plugin add https://git-wip-us.apache.org/repos/asf/cordova-plugin-device.git
	#phonegap local plugin add https://git-wip-us.apache.org/repos/asf/cordova-plugin-dialogs.git
	#phonegap local plugin add https://git-wip-us.apache.org/repos/asf/cordova-plugin-file-transfer.git
	#phonegap local plugin add https://git-wip-us.apache.org/repos/asf/cordova-plugin-file.git
	#phonegap local plugin add https://git-wip-us.apache.org/repos/asf/cordova-plugin-geolocation.git
	#phonegap local plugin add https://git-wip-us.apache.org/repos/asf/cordova-plugin-globalization.git
	phonegap local plugin add https://git-wip-us.apache.org/repos/asf/cordova-plugin-inappbrowser.git
	#phonegap local plugin add https://git-wip-us.apache.org/repos/asf/cordova-plugin-media-capture.git
	#phonegap local plugin add https://git-wip-us.apache.org/repos/asf/cordova-plugin-media.git
	#phonegap local plugin add https://git-wip-us.apache.org/repos/asf/cordova-plugin-network-information.git
	phonegap local plugin add https://git-wip-us.apache.org/repos/asf/cordova-plugin-splashscreen.git
	#phonegap local plugin add https://git-wip-us.apache.org/repos/asf/cordova-plugin-vibration.git
}

list_installed_plugins(){
	echo "Listing currently installed plugins..."
	phonegap local plugin list
}

remove_default_plugins(){
	#phonegap local plugin remove org.apache.cordova.core.AudioHandler
	#phonegap local plugin remove org.apache.cordova.core.battery-status
	#phonegap local plugin remove org.apache.cordova.core.camera
	#phonegap local plugin remove org.apache.cordova.core.console
	#phonegap local plugin remove org.apache.cordova.core.contacts
	phonegap local plugin remove org.apache.cordova.core.device
	#phonegap local plugin remove org.apache.cordova.core.device-motion
	#phonegap local plugin remove org.apache.cordova.core.device-orientation
	#phonegap local plugin remove org.apache.cordova.core.dialogs
	#phonegap local plugin remove org.apache.cordova.core.file
	#phonegap local plugin remove org.apache.cordova.core.file-transfer
	#phonegap local plugin remove org.apache.cordova.core.geolocation
	#phonegap local plugin remove org.apache.cordova.core.globalization
	phonegap local plugin remove org.apache.cordova.core.inappbrowser
	#phonegap local plugin remove org.apache.cordova.core.media-capture
	#phonegap local plugin remove org.apache.cordova.core.network-information
	phonegap local plugin remove org.apache.cordova.core.splashscreen
	#phonegap local plugin remove org.apache.cordova.core.vibration
}

script_usage(){
	echo "Usage: ag_project [project|plugins] [create|install|remove|delete] [package name|plugin name] [project name] [project folder]"
	exit 1
}
#end of functions

#check parameters
if [[ $# -lt 2 ]] ; then
	script_usage
fi

#create a project
#[project|plugins] [create|delete|install|remove] [package name|plugin name] [project name] [project folder]
if [[ $1 == "project" ]] ; then

	#create
	if [[ $2 == "create" ]] ; then
	
		if [[ $# -ne 5 ]] ; then
			script_usage
		fi
		echo "Creating a new Phonegap project..."
		phonegap create $5 $3 $4

		cd $5
		rc=$?
		if [[ $rc != 0 ]] ; then
			echo "Failed to change to the project folder $5. ($rc)"
			exit $rc
		fi

		phonegap -V build ios
		rc=$?
		if [[ $rc != 0 ]] ; then
			echo "Phonegap build for iOS failed. ($rc)"
			exit $rc
		fi

		phonegap -V build android
		rc=$?
		if [[ $rc != 0 ]] ; then
			echo "Phonegap build for Android failed. ($rc)"
			exit $rc
		fi
		
		ls -la
		
		echo "Successfully created project $4"
	fi
	#end create
	
	#delete
	if [[ $2 == "delete" ]] ; then
		if [[ $# -ne 3 ]] ; then
			script_usage
		fi
		
		rm -rf $3
		rc=$?
		if [[ $rc != 0 ]] ; then
			echo "Failed to delete the project in folder $3 ($rc)"
			exit $rc
		fi
		
		echo "Deleted the project located in folder $3!"
	fi
	
fi

#install default plugins
#[project|plugins] [create|install|remove|delete] [package name|plugin name] [project name] [project folder]
if [[ $1 == "plugins" ]] ; then

	if [[ $# -ne 2 ]] ; then
		script_usage
	fi
		
	if [[ $2 == "install" ]] ; then
		echo "Installing default cordova plugin set..."
		install_default_plugins
		
		echo "Installing default appgiraffe plugin set..."
		install_appgiraffe_plugins
	fi
	
	if [[ $2 == "remove" ]] ; then
		echo "Removing default cordova plugin set..."
		remove_default_plugins
		
		echo "Removing default appgiraffe plugin set..."
		remove_appgiraffe_plugins
	fi
	
	echo "Currently installed plugins:"	
	list_installed_plugins
fi

exit 0