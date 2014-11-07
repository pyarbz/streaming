# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :detail_closure do
    depth 100
    descendant_detail_id nil
    ancestor_detail_id nil
  end
end
