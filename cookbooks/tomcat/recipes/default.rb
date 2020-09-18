#
# Cookbook:: tomcat
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.
=begin
execute 'group-add' do
 command "sudo groupadd tomcat"
 command "sudo useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat"
end
=end

apt_package 'tomcat9' do
    action :install
end
service 'tomcat9' do
  action [:enable, :start]
end

cookbook_file '/etc/tomcat9/tomcat-users.xml' do
  source 'tomusers.xml'
  notifies :restart , 'service[tomcat9]'# resource['package name']
end

cookbook_file '/lib/systemd/system/tomcat9.service' do
  source 'config.service'
  notifies :restart , 'service[tomcat9]'
end

file '/var/lib/tomcat9/webapps/hi.html' do
  content '<h1>Hello-world from Chaithu!!</h1>'
  notifies :restart ,'service[tomcat9]'
end

=begin
template '/etc/default/tomcat9' do
  source 'tomtemplate.erb'
  action :create
  notifies :restart,'service[tomcat9]'
end
# Install Jenkins/other package frome remote repository
remote_file '/var/lib/tomcat9/webapps/jenkins.war' do
  source 'https://mirrors.tuna.tsinghua.edu.cn/jenkins/war-stable/2.249.1/jenkins.war'#specify download path of jenkins.war in official website
  action :create
  notifies :restart , 'service[tomcat9]'
end

=end