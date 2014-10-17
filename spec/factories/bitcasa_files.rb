# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bitcasa_file do
    name "MyString"
    file_id "MyString"
    path nil
    broadcast nil
    size nil
    extension nil
    genre nil
    bitcasa_time nil
  end
end
