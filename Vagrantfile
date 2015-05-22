# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure(2) do |config|
  config.vm.define "wrt" do |wrt_cfg|
  wrt_cfg.vm.box = 'hryamzik/openwrt.12.09'
  wrt_cfg.vm.network "private_network", ip: "192.168.71.1", name: "vboxnet1", adapter:2, auto_config: false
  wrt_cfg.vm.network :forwarded_port, host: 8080, guest: 80
  wrt_cfg.vm.network :forwarded_port, host: 2223, guest: 22
  wrt_cfg.ssh.insert_key = false
  wrt_cfg.vm.provider :virtualbox do |v|
    v.name = "wrt"
    v.gui = true
    v.customize ["modifyvm", :id, "--usb", "off"]
    v.customize ["modifyvm", :id, "--usbehci", "off"]
  end
  wrt_cfg.vm.synced_folder ".", "/vagrant", disabled: true
end
end
