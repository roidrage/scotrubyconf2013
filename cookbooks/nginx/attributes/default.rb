default[:nginx][:version] = '1.1.19-1'
default[:nginx][:host_name] = 'travis-ci.org'
default[:nginx][:www_root] = "/var/www/#{node[:nginx][:host_name]}/current"

default[:nginx][:sites_available] = '/etc/nginx/sites-available/'
default[:nginx][:sites_enabled] = '/etc/nginx/sites-enabled/'
default[:nginx][:site_config] = "#{node[:nginx][:sites_available]}/#{node[:nginx][:host_name]}"

default[:users] = [{
  login: 'deploy',
  shell: '/bin/zsh',
  home: '/var/www',
  id: 1001
}]
