# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :path do
    parent "MyString"
    current "MyString"
    depth 1
    bitcasa_file nil
    bitcasa_folder nil
  end
end
