class Chef
  class Provider
    class MailhogService
      # Provider actions for platforms using Upstart
      #
      # @since 1.0.0
      # @author Achim Rosenhagen <a.rosenhagen@ffuenf.de>
      class MailhogServiceUpstart < Chef::Provider::MailhogServiceBase
        provides :mailhog_service, os: 'linux' do
          Chef::Platform::ServiceHelpers.service_resource_providers.include?(:upstart) &&
            !Chef::Platform::ServiceHelpers.service_resource_providers.include?(:redhat)
        end if defined?(provides)

        action :start do
          template "#{new_resource.name} :create /etc/init/#{new_resource.name}.conf" do
            path "/etc/init/#{new_resource.name}.conf"
            cookbook 'mailhog'
            source 'upstart/mailhog.erb'
            owner 'root'
            group 'root'
            mode 00744
            variables(
              mailhog_name: new_resource.name,
              mailhog: node['mailhog']
            )
            action :create
          end

          # Start up the service
          service "#{new_resource.name} :start" do
            service_name new_resource.name
            provider Chef::Provider::Service::Upstart
            supports status: true, restart: true
            action [:start, :enable]
          end
        end

        action :stop do
          service "#{new_resource.name} :stop" do
            service_name new_resource.name
            provider Chef::Provider::Service::Upstart
            supports status: true, restart: true
            action [:stop, :disable]
          end
        end

        action :delete do
          service "#{new_resource.name} :delete" do
            service_name new_resource.name
            provider Chef::Provider::Service::Upstart
            supports status: true
            action [:stop, :disable]
          end
        end

        action :restart do
          service "#{new_resource.name} :restart" do
            service_name new_resource.name
            supports status: true, restart: true
            provider Chef::Provider::Service::Upstart
            action :restart
          end
        end

        action :reload do
          service "#{new_resource.name} :reload" do
            service_name new_resource.name
            provider Chef::Provider::Service::Upstart
            supports status: true, reload: true
            action :reload
          end
        end
      end
    end
  end
end