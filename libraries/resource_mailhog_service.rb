class Chef
  class Resource
    # Resource interface, minimum to get a running mailhog binary
    #
    # @since 1.0.0
    # @author Achim Rosenhagen <a.rosenhagen@ffuenf.de>
    class MailhogService < Chef::Resource::LWRPBase
      actions :create, :delete, :start, :stop, :restart, :reload
      default_action [:create, :start]

      provides :mailhog_service
    end
  end
end
