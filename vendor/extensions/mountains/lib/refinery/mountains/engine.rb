module Refinery
  module Mountains
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Mountains

      engine_name :refinery_mountains

      initializer "register refinerycms_mountains plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "mountains"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.mountains_admin_mountains_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/mountains/mountain',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Mountains)
      end
    end
  end
end
