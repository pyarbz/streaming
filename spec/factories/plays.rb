# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :play do
    count 1
    played_at "2014-10-18 11:49:01"
    user nil
    bitcasa_file nil
  end
end
