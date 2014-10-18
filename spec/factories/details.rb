# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :detail do
    parent_path "MyString"
    current_path "MyString"
    depth 1
    bitcasa_created_at "2014-10-18 22:55:25"
    bitcasa_modified_at "2014-10-18 22:55:25"
    bitcasa_changed_at "2014-10-18 22:55:25"
    size 1
    high_definition false
    blu_ray false
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
