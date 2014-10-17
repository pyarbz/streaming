# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :broadcast do
    onair false
    movie false
    ova false
    complete false
    year 1
    season nil
  end
end
