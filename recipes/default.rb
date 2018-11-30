# install base packages
node['scalr_base_webhook']['packages'].each do |pkg|
  package pkg do
    action :install
  end
end

node['scalr_base_webhook']['pip'].each do |pip|
  python_package pip do
    action :install
  end
end

# disable SeLinux for CentOS
selinux_state 'disabled' do
  action :disabled
  only_if { centos? }
end

# install docker
docker_installation 'default' do
  # version node['scalr_base_webhook']['docker']['version']
  action :create
end

basefolder = "/opt/#{node['scalr_base_webhook']['webhookname']}"
# folders
[basefolder, node['scalr_base_webhook']['logsfolder']].each do |folder|
  directory folder do
    action :create
  end
end

# create base required files
%w(docker-compose.yml uwsgi.ini Dockerfile requirements.txt relaunch.sh).each do |filename|
  template "#{basefolder}/#{filename}" do
    source "#{filename}.erb"
    variables(
      webhookname: node['scalr_base_webhook']['webhookname'],
      webhookport: node['scalr_base_webhook']['webhookport']
    )
    mode 0755 if filename == 'relaunch.sh'
  end
end

# get webhook.py
remote_file "#{basefolder}/webhook.py" do
  source node['scalr_base_webhook']['webhookpy']
  action :create
end
