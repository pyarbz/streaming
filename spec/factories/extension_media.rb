# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :extension_medium, :class => 'ExtensionMedia' do
    mimetype nil
    extension nil
    media nil
  end
end
