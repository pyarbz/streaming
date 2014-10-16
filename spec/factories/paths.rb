# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :path do
    parent "MyString"
    current "MyString"
    depth 1
  end
end
