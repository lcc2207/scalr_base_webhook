name 'scalr_base_webhook'
maintainer 'The Authors'
maintainer_email 'you@example.com'
license 'All Rights Reserved'
description 'Installs/Configures scalr_base_webhook'
long_description 'Installs/Configures scalr_base_webhook'
version '0.1.0'
chef_version '>= 13.0'

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/scalr_base_webhook/issues'

# The `source_url` points to the development repository for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/scalr_base_webhook'

depends 'chef-sugar'
depends 'docker', '~> 4.6.8'
depends 'poise-python', '~> 1.7.0'
depends 'selinux', '~> 2.1.1'
