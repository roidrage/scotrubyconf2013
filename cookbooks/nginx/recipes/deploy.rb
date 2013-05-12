include_recipe "nginx::setup"

package "git" do
  action :install
end

directory "/var/www/travis-ci.org/shared/config" do
  action :create
end

template "/var/www/travis-ci.org/shared/config/database.yml" do
  source "database.yml.erb"
  owner "www-data"
  group "www-data"
  mode "600"
end

deploy "/var/www/travis-ci.org" do
  migrate false
  repo "file:///src/travis-ci.org"
  notifies :reload, 'service[nginx]'
  symlinks({})
  symlink_before_migrate({})
end
