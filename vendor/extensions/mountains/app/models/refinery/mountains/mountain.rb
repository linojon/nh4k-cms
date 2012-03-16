module Refinery
  module Mountains
    class Mountain < Refinery::Core::BaseModel
      self.table_name = 'refinery_mountains'      
    
      acts_as_indexed :fields => [:name, :trailsnh, :netc, :amc, :notes]

      validates :name, :presence => true, :uniqueness => true
              
    end
  end
end
