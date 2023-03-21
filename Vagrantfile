CONFIG_VERSION = "2"

%w[vagrant-hostmanager vagrant-hostsupdater vagrant-vbguest].each do |plugin_name|
  unless Vagrant.has_plugin? plugin_name
    raise "Vagrant plugin #{plugin_name} is required. Please install it in this way. `vagrant plugin install #{plugin_name}`"
  end
end

if Vagrant::Util::Platform.windows?
  unless Vagrant.has_plugin? "vagrant-winnfsd"
    raise "Vagrant plugin vagrant-winnfsd is required. Please install it in this way. `vagrant plugin install vagrant-winnfsd`"
  end
end

Vagrant.configure(CONFIG_VERSION) do |config|
  config.vm.box = "centos/8"
  config.vm.hostname = "mypage.local"
  config.vm.network :private_network, ip: "192.168.99.101"

  if Vagrant::Util::Platform.windows?
    config.winnfsd.uid = 1000
    config.winnfsd.gid = 1000
    config.vm.synced_folder ".", "/home/vagrant/mypage-env", type: "nfs"
  else
    config.vm.synced_folder ".", "/home/vagrant/mypage-env"
  end

  config.vm.provider "virtualbox" do |vb|
    vb.name = "mypage"
    vb.gui = false
    vb.cpus = 2
    vb.memory = "4096"
  end

  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.vbguest.auto_update = false
  config.vbguest.no_remote = true

  config.vm.provision "shell", :path => "provision.sh", :privileged => false
end
