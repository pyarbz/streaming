# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :broadcast do
    onair false
    movie false
    ova false
    complete false
    year nil
    season nil
    bitcasa_file nil
    bitcasa_folder nil
  end
end
