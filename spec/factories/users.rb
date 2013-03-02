# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name 'Test User'
    email 'example@example.com'
    password 'changeme'
    password_confirmation { password }
    confirmed_at Time.now
  end
  
  factory :manager, :class => User do
    name 'Manager User'
    email 'manager@mm.com'
    password 'password'
    password_confirmation { password }
    confirmed_at Time.now
    roles { [Role.find_or_create_by_name(:manager)] }
  end
end
