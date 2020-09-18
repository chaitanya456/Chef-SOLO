#
# Cookbook:: ker
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.
=begin
sysctl_param 'vm.swappiness' do
    value 20
end #proc/sys/vm/swappiness

sysctl_param 'max_map_count ' do
    key '/proc/sys/vm/max_map_count'
    value 10000
end

sysctl_param 'net.ipv4.tcp_fin_timeout' do
    key "/proc/sys/"
    value 30
    action :remove
end #proc/sys/net/ipv4/tcp_fin_timeout
=end
template "/etc/sysctl.d/99-chef-vm.swappiness.conf" do
    source "config.conf.erb"
    action :create
end 
template 'net.ipv4.tcp_fin_timeout' do
    source 'conf.erb'
    action :create 
    mode '0755'
end #proc/sys/net/ipv4/tcp_fin_timeout

