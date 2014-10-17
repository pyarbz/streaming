# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :play do
    count 1
    played_at "2014-10-17 17:10:16"
    user nil
    bitcasa_file nil
  end
end
