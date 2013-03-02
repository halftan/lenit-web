# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :authentication do
    provider "MyString"
    access_token "MyString"
    refresh_token "MyString"
    expires_in 1
    user nil
    uid "MyString"
  end
end
