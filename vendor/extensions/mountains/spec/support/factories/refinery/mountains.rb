
FactoryGirl.define do
  factory :mountain, :class => Refinery::Mountains::Mountain do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

