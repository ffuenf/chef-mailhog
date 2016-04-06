name             'mailhog'
maintainer       'Achim Rosenhagen'
maintainer_email 'a.rosenhagen@ffuenf.de'
license          'MIT'
description      'Installs/Configures mailhog and mhsendmail'
version          '1.0.0'
source_url       'https://github.com/ffuenf/chef-mailhog'
issues_url       'https://github.com/ffuenf/chef-mailhog/issues'

provides         'service[mailhog]'

%w(debian ubuntu centos redhat smartos).each do |os|
  supports os
end
