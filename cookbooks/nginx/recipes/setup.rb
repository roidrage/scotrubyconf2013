package "nginx" do
  version node[:nginx][:version]
  action :install
end

service "nginx" do
  supports reload: true
  action :start
end

directory node[:nginx][:www_root] do
  action :create
  owner "www-data"
  group "www-data"
  recursive true
end

template "/etc/nginx/sites-available/travis-ci.org" do
  source "travis-ci.org.erb"
  variables host_name: node[:nginx][:host_name],
            www_root: node[:nginx][:www_root]
  notifies :reload, 'service[nginx]'
  owner "www-data"
  group "www-data"
  mode "0644"
end

cookbook_file "/etc/nginx/ssl.cert" do
  source "ssl.cert"
  owner "www-data"
  group "www-data"
  mode "0600"
  notifies :reload, 'service[nginx]'
end

link "#{node[:nginx][:sites_enabled]}/#{node[:nginx][:host_name]}" do
  to node[:nginx][:site_config]
  owner "www-data"
  notifies :reload, 'service[nginx]'
end
