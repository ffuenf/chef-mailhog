class Chef
  class Provider
    class MailhogService
      # Provider actions for platforms using SysVinit
      #
      # @since 1.0.0
      # @author Achim Rosenhagen <a.rosenhagen@ffuenf.de>
      class MailhogServiceSysVinit < Chef::Provider::MailhogServiceBase
        provides :mailhog_service, os: '!windows' if defined?(provides)

        action :start do
          template "#{res_name} :create /etc/init.d/#{new_resource.name}" do
            path "/etc/init.d/#{new_resource.name}"
            cookbook 'mailhog'
            source 'sysvinit/mailhog.erb'
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
            provider Chef::Provider::Service::Init::Insserv if node['platform_family'] == 'debian'
            provider Chef::Provider::Service::Init::Redhat  if node['platform_family'] == 'redhat'
            supports status: true, restart: true
            action [:start, :enable]
          end
        end

        action :stop do
          service "#{new_resource.name} :stop" do
            service_name new_resource.name
            provider Chef::Provider::Service::Init::Insserv if node['platform_family'] == 'debian'
            provider Chef::Provider::Service::Init::Redhat  if node['platform_family'] == 'redhat'
            supports status: true, restart: true
            action [:stop, :disable]
          end
        end

        action :delete do
          service "#{new_resource.name} :delete" do
            service_name new_resource.name
            provider Chef::Provider::Service::Init::Insserv if node['platform_family'] == 'debian'
            provider Chef::Provider::Service::Init::Redhat  if node['platform_family'] == 'redhat'
            supports status: true
            action [:stop, :disable]
          end
        end

        action :restart do
          service "#{new_resource.name} :restart" do
            service_name new_resource.name
            supports status: true, restart: true
            provider Chef::Provider::Service::Init::Insserv if node['platform_family'] == 'debian'
            provider Chef::Provider::Service::Init::Redhat  if node['platform_family'] == 'redhat'
            action :restart
          end
        end

        action :reload do
          service "#{new_resource.name} :reload" do
            service_name new_resource.name
            provider Chef::Provider::Service::Init::Insserv if node['platform_family'] == 'debian'
            provider Chef::Provider::Service::Init::Redhat  if node['platform_family'] == 'redhat'
            supports status: true, reload: true
            action :reload
          end
        end
      end
    end
  end
end