module Refinery
  module Mountains
    module Admin
      class MountainsController < ::Refinery::AdminController

        crudify :'refinery/mountains/mountain',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
