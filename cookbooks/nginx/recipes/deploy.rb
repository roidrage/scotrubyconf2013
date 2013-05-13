include_recipe "nginx::setup"

package "git" do
  action :install
end

directory "#{node[:nginx][:shared_dir]}/config" do
  action :create
  recursive true
end

template "#{node[:nginx][:shared_dir]}/database.yml" do
  source "database.yml.erb"
  owner "www-data"
  group "www-data"
  mode "600"
end

deploy node[:nginx][:app_root] do
  migrate false
  repo "file:///src/travis-ci.org"
  notifies :reload, 'service[nginx]'
  symlinks({})
  symlink_before_migrate({})
end
