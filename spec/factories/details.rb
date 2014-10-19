# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :detail do
    path "MyString"
    bitcasa_created_at "2014-10-19 19:35:55"
    bitcasa_modified_at "2014-10-19 19:35:55"
    bitcasa_changed_at "2014-10-19 19:35:55"
    size 1
    high_definition false
    blu_ray false
    onair false
    movie false
    ova false
    complete false
    year nil
    season nil
    category nil
    media nil
    genre nil
  end
end
