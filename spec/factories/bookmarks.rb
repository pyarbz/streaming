# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bookmark do
    count 1
    flag false
    user nil
    bitcasa_file nil
  end
end
