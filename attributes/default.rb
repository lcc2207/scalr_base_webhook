# base packages
default['scalr_base_webhook']['packages'] = if node['platform'] == 'ubuntu'
                                              ['python-pip', 'pylint']
                                            else
                                              ['python2-pip', 'pylint']
                                            end

default['scalr_base_webhook']['pip'] = %w(docker-compose jsonlint yamllint jenkins-job-builder scalr-ctl)
default['scalr_base_webhook']['docker']['version'] = 'latest'

# defaults
default['scalr_base_webhook']['webhookname'] = 'webhook'
default['scalr_base_webhook']['logsfolder'] = '/var/log/webhook'
default['scalr_base_webhook']['webhookport'] = '5018'

# webhook.py
default['scalr_base_webhook']['webhookpy'] = 'https://raw.githubusercontent.com/scalr-tutorials/scalr-command-webhook/master/webhook.py'
