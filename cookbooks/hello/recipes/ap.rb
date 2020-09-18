#installs Apache Web Server
package "apache2" do
    action :install
end
 
service "apache2" do
    action [:enable, :start]
end

packages = ["git","vim","tree","curl"]
packages.each do |i|
    package i do 
        action :install
    end
end
template '/etc/apache2/ports.conf' do
    source 'po.conf.erb'
    action :create
end
file "/etc/apache2/index.html" do
	content '<h1><center>Hello world from Chaithanya Krishna</h1><center>'
end
