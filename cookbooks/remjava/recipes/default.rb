#
# Cookbook:: remjava
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.
=begin
apt_update 'update' do
    action :update
end
package 'default-jdk' do
    action :install
end

file '/home/C.java' do
    content 'class C{
            public static void main(String a[])
            { 
                    System.out.print("Hi");
            }
        }'
end
#installs Apache Web Server
execute "apt-get-update" do
    command "apt-get update"
end
 
package 'default-jdk' do
    action :install
end
 
file "/home/ubuntu/hello.java" do
    content 'class hello{
        public static void main(String args[]){
            System.out.println("Hello World from Chandu!!!");
        }
    }'
end
=end
remote_file '/home/ubuntu/javadownload' do
    source 'https://sdlc-esd.oracle.com/ESD6/JSCDL/jdk/8u261-b12/a4634525489241b9a9e1aa73d9e118e6/jre-8u261-linux-x64.tar.gz?GroupName=JSC&FilePath=/ESD6/JSCDL/jdk/8u261-b12/a4634525489241b9a9e1aa73d9e118e6/jre-8u261-linux-x64.tar.gz&BHost=javadl.sun.com&File=jre-8u261-linux-x64.tar.gz&AuthParam=1600260894_2445'
    action :create
end