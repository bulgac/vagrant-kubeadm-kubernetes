
#system('./before-install.sh')


NUM_WORKER_NODES=2
IP_NW="192.168.200."
IP_START=10

Vagrant.configure("2") do |config|

  config.vm.provision "shell", env: {"IP_NW" => IP_NW, "IP_START" => IP_START}, inline: <<-SHELL
      echo "$IP_NW$((IP_START)) master-node" >> /etc/hosts
      echo "$IP_NW$((IP_START+1)) worker-node01" >> /etc/hosts
      echo "$IP_NW$((IP_START+2)) worker-node02" >> /etc/hosts
  SHELL

  config.vm.box = "generic/ubuntu2004"

  config.vm.box_check_update = true

  config.vm.define "master" do |master|
    master.vm.hostname = "master-node"
    master.vm.network "private_network", ip: IP_NW + "#{IP_START}"
    master.vm.provider "virtualbox" do |vb|
        vb.memory = 4048
        vb.cpus = 2
        vb.name = "k8s-master-node"
    end

    # master.vm.provision "shell", path: "scripts/common.sh"
    # master.vm.provision "shell", path: "scripts/master.sh"
  end

  (1..NUM_WORKER_NODES).each do |i|

  config.vm.define "node0#{i}" do |node|
    node.vm.hostname = "worker-node0#{i}"
    node.vm.network "private_network", ip: IP_NW + "#{IP_START + i}"
    node.vm.provider "virtualbox" do |vb|
        vb.memory = 2048
        vb.cpus = 1
        vb.name = "k8s-worker-node0#{i}"
    end
    # node.vm.provision "shell", path: "scripts/common.sh"
    # node.vm.provision "shell", path: "scripts/node.sh"
  end

  end
end

#system('./install.sh')
