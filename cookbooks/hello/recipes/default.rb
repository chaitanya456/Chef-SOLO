#
# Cookbook:: hello
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.



#installs Apache Web Server
package "apache2" do
    action :install
end
 
service "apache2" do
    action [:enable, :start]
end



=begin
file 'ind.html' do
	content '<h1>Hello world!!</h1>'
end
file 'Hello' do 
	content  "Hello chaithanya"
	
end
=end