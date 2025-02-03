Vagrant.configure("2") do |config|
    
    config.vm.define "tomcat" do |tomcat|
        tomcat.vm.box = "spox/ubuntu-arm" 
        tomcat.vm.hostname = "tomcat"
        tomcat.vm.network "private_network", ip: "192.168.58.100" 
    
        tomcat.vm.provider "vmware_desktop" do |vmware|
          vmware.memory = "1024"
          vmware.gui = true
        end
    end

end
  