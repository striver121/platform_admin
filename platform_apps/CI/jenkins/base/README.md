# Get the Plugins from existing running Jenkins Instance.

Go to your instance $ip:8080/script and copy paste following groovy statement:


```
Jenkins.instance.pluginManager.plugins.each{
  plugin -> 
    println ("- ${plugin.getShortName()}:${plugin.getVersion()}")
}
```
Copy & paste the output under Jenkins values.yaml **InstallPlugins" section.
