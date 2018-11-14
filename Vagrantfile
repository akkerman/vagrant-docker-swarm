# -*- mode: ruby -*-
# vi: set ft=ruby shiftwidth=2:
Vagrant.configure(2) do |config|
  config.vm.box = "bento/ubuntu-18.04"

  config.vm.provider "virtualbox" do |vbox|
    vbox.memory = 2048
    vbox.cpus = 2
    vbox.customize ["modifyvm", :id, "--ioapic", "on"]
    vbox.customize ["modifyvm", :id, "--groups", "/docker-swarm"]
  end

  N = 2

  workers = Array.new

  (0..N).each do |id|
    if id == 0
      hostname = "manager"
    else
      hostname = "worker#{id}"
      workers.push(hostname)
    end

    config.vm.define hostname do |node|
      node.vm.hostname = hostname
      node.vm.network "private_network", ip: "192.168.20.#{120+id}"


      node.vm.provision "main", type: "ansible_local" do |ansible|
        ansible.compatibility_mode = "2.0"
        ansible.limit = hostname
        ansible.extra_vars = {
          ansible_python_interpreter: "/usr/bin/python3"
        }
        ansible.playbook = "provisioning/playbook.yml"
        ansible.groups = {
          "managers" => ["manager"],
          "workers" => workers,
        }
      end
    end
  end
end
