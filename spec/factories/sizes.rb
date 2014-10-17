# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :size do
    size 1
    high false
    blu_ray false
    bitcasa_file nil
    bitcasa_folder nil
  end
end
