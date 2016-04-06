class Chef
  class Provider
    class MailhogService
      # Provider actions for platforms using Systemd
      #
      # @since 1.0.0
      # @author Achim Rosenhagen <a.rosenhagen@ffuenf.de>
      class MailhogServiceSystemd < Chef::Provider::MailhogServiceBase
        provides :mailhog_service, os: 'linux' do
          Chef::Platform::ServiceHelpers.service_resource_providers.include?(:systemd)
        end if defined?(provides)

        action :start do
          template "#{new_resource.name} :create /etc/systemd/system/#{new_resource.name}" do
            path "/etc/systemd/system/#{new_resource.name}.service"
            cookbook 'mailhog'
            source 'systemd/mailhog.erb'
            owner 'root'
            group 'root'
            mode 00744
            variables(
              mailhog_name: new_resource.name,
              mailhog: node['mailhog']
            )
            action :create
            notifies :run, 'execute[systemctl daemon-reload]', :immediately
          end

          execute 'systemctl daemon-reload' do
            action :nothing
          end

          service "#{new_resource.name} :start" do
            service_name new_resource.name
            provider Chef::Provider::Service::Systemd
            supports status: true, restart: true
            action [:start, :enable]
          end
        end

        action :stop do
          service "#{new_resource.name} :stop" do
            service_name new_resource.name
            provider Chef::Provider::Service::Systemd
            supports status: true, restart: true
            action [:stop, :disable]
          end
        end

        action :delete do
          service "#{new_resource.name} :delete" do
            service_name new_resource.name
            provider Chef::Provider::Service::Systemd
            supports status: true
            action [:stop, :disable]
            notifies :run, 'execute[systemctl daemon-reload]', :immediately
          end

          execute 'systemctl daemon-reload' do
            action :nothing
          end
        end

        action :restart do
          service "#{new_resource.name} :restart" do
            service_name new_resource.name
            supports status: true, restart: true
            provider Chef::Provider::Service::Systemd
            action :restart
          end
        end

        action :reload do
          service "#{new_resource.name} :reload" do
            service_name new_resource.name
            provider Chef::Provider::Service::Systemd
            supports status: true, reload: true
            action :reload
          end
        end
      end
    end
  end
end
