# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :provider do
    name "MyString"
    manager nil
    description "MyText"
  end
end
