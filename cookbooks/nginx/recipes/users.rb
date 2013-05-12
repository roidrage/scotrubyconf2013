node[:users].each do |user|
  user user[:login] do
    uid user[:id]
    shell user[:shell]
    home user[:home]
    action :manage
  end
end
