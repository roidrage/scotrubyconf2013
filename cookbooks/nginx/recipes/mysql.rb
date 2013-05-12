package "mysql-server" do
  action :install
end

service "mysql-server" do
  support restart: true
  action :nothing
end

template "/etc/mysql/my.cnf" do
  source "my.cnf.erb"
  owner "mysql"
  group "mysql"
  mode "0644"
  notifies :restart, 'service[mysql]'
end
