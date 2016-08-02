name             'mailhog'
maintainer       'Achim Rosenhagen'
maintainer_email 'a.rosenhagen@ffuenf.de'
license          'MIT'
description      'Installs/Configures mailhog and mhsendmail'
source_url       'https://github.com/ffuenf/chef-mailhog'
issues_url       'https://github.com/ffuenf/chef-mailhog/issues'
version          '0.2.0'

provides         'service[mailhog]'

%w(debian ubuntu centos redhat smartos).each do |os|
  supports os, '>= 0.0.0'
end
