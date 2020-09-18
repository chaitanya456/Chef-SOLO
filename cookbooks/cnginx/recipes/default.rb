#
# Cookbook:: nginx
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.
package 'nginx' do
    action :install
end
service 'nginx' do
    action [ :enable , :start ]
end
template "/etc/nginx/sites-enabled/default" do
    source 'modify.erb'
    action :create
    notifies :restart , 'service[nginx]'
end
