# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :category_medium, :class => 'CategoryMedia' do
    category nil
    media nil
  end
end
