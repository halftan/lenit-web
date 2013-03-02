# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    name "MyString"
    location "MyString"
    time "2013-01-30 17:28:35"
    duration 100
    level 1
  end
end
