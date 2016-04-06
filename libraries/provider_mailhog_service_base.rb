class Chef
  class Provider
    # Base Provider interface
    #
    # Global actions here. Service control actions to be subclassed per-platform
    # @since 1.0.0
    # @author Achim Rosenhagen <a.rosenhagen@ffuenf.de>
    class MailhogServiceBase < Chef::Provider::LWRPBase
      # Chef 11 LWRP DSL Methods
      use_inline_resources if defined?(use_inline_resources)

      provides :mailhog_service

      # @return [TrueClass] true
      def whyrun_supported?
        true
      end

      action :create do
        if !::File.exist?(node['mailhog']['binary']['path']) && !::File.exist?(node['mailhog']['mhsendmail']['binary']['path'])
          arch = node['kernel']['machine'] =~ /x86_64/ ? 'amd64' : '386'
          if node['mailhog']['binary']['url']
            mh_binary_url = node['mailhog']['binary']['url']
            mh_checksum = node['mailhog']['binary']['checksum']
            mhsendmail_binary_url = node['mailhog']['mhsendmail']['binary']['url']
            mhsendmail_checksum = node['mailhog']['mhsendmail']['binary']['checksum']
          else
            mh_binary_url = "#{node['mailhog']['binary']['prefix_url']}#{node['mailhog']['binary']['version']}/MailHog_linux_#{arch}"
            mh_checksum = node['mailhog']['binary']['checksum']["linux_#{arch}"]
            mhsendmail_binary_url = "#{node['mailhog']['mhsendmail']['binary']['prefix_url']}#{node['mailhog']['mhsendmail']['binary']['version']}/mhsendmail_linux_#{arch}"
            mhsendmail_checksum = node['mailhog']['mhsendmail']['binary']['checksum']["linux_#{arch}"]
          end
          remote_file node['mailhog']['binary']['path'] do
            source mh_binary_url
            checksum mh_checksum
            mode node['mailhog']['binary']['mode']
            action :create
          end
          remote_file node['mailhog']['mhsendmail']['binary']['path'] do
            source mhsendmail_binary_url
            checksum mhsendmail_checksum
            mode node['mailhog']['mhsendmail']['binary']['mode']
            action :create
          end
          new_resource.updated_by_last_action(true)
        end
      end

    end
  end
end
