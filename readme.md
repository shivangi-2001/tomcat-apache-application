# Apache Tomcat Setup with Vagrant and Shell Script

<sub>This project sets up an Apache Tomcat 10 server inside a Vagrant-managed virtual machine using a provisioning shell script.</sub>

### Requirements

**Before running this project, ensure you have the following installed:**

1. [Vagrant](https://www.vagrantup.com/downloads) (2.2+ recommended)
2. [VMware Desktop](https://www.vmware.com/products/workstation-pro.html) (for virtualization)
3. [VMware Vagrant Plugin](https://developer.hashicorp.com/vagrant/docs/providers/vmware)
4. **An active internet connection** (for downloading dependencies)


👉 [Setup Vagrant & Virtual Machine on macOS (M1/M2/M3/M4)](https://medium.com/django-unleashed/vmware-vagrant-installation-on-macos-m1-m2-m3-chip-bb162dde53e7)

**Setup Instruction** 

**1. Clone the Repository**
```
git clone https://github.com/your-repo/tomcat-vagrant.git
cd tomcat-vagrant
```

**2. Start the Vagrant Machine**
<sub>Run the following command to initialize the VM:</sub>
```
vagrant up
```

✅ Create a virtual machine with **Ubuntu ARM**(spox/ubuntu-arm box)
✅ Assign the VM a **private IP: 192.168.58.100**
✅ Allocate **1GB RAM**
✅ Use the **VMware provider**

**3. Connect to the VM**
After the setup is complete, SSH into the VM:
```
vagrant ssh 
```
**4. Run the Tomcat Installation Script**
<sub>Once inside the VM, navigate to the project directory (if required) and run:</sub>
```
chmod +x tomcat.sh
./tomcat.sh
```
This script will:
**✔️ Update package lists**
**✔️ Install OpenJDK 11**
**✔️ Download and set up Apache Tomcat 10**
**✔️ Create a Tomcat systemd service**
**✔️ Deploy a sample WAR application**
**✔️ Start and enable the Tomcat service**

**5. Access Tomcat Web Interface**
<sub>Once the setup completes, you can access Tomcat Manager in a web browser:</sub>
🔗 http://192.168.58.100:8080/

If you deployed a sample application, access it via:
🔗 http://192.168.58.100:8080/sample/

### Stopping and Destroying the VM

**To stop the VM:**
```
vagrant halt
```
**To completely remove the VM:**
```
vagrant destroy -f
```

### Customization

🔧 **Modify** ```tomcat.sh``` to install a different **Java** or **Tomcat version**.
🔧 **Change** ```Vagrantfile``` to adjust **RAM, CPU, or IP settings.**
🔧 **Update firewall rules** if needed for external access.

### Troubleshooting

🚨 ***VMware Provider Issues?*** Ensure the VMware Vagrant plugin is installed:
```
vagrant plugin install vagrant-vmware-desktop
```


<sub>Now you're all set to run Apache Tomcat in a Vagrant-managed VM! 🚀</sub>