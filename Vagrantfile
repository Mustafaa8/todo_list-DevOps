Vagrant.configure("2") do |config|
  config.vm.box = "eurolinux-vagrant/centos-stream-9"
  config.vm.define "machine1" do |machine1|
    machine1.vm.network "private_network", ip: "192.168.33.50"
    machine1.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.name = "To-DO list machine 1"
      vb.memory = 1024
      vb.cpus = 2
    end
  end
end