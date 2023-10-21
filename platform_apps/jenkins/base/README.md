# Get the Plugins from existing running Jenkins Instance.

###  Go to usi https://$ip:8080/script and copy paste following:

take the output and add it into the Jenkins values.yaml under **InstallPlugins" section.

Jenkins.instance.pluginManager.plugins.each{
  plugin -> 
    println ("- ${plugin.getShortName()}:${plugin.getVersion()}")
}
