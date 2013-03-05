### GIVEN ###

Given /^I have a provider named "(.*?)"$/ do |provider|
  @user.providers.create! :name => provider
end

Given /^user named "(.*?)" has provider "(.*?)"$/ do |user_name, provider_name|
  User.find_by_name!(user_name).providers.create! :name => provider_name
end

Given(/^provider named "(.*?)" has event named "(.*?)" location "(.*?)"$/) do |pname, ename, elocation|
  Provider.find_by_name(pname).provided_events.create! name: ename, location: elocation
end


When /^I goto the edit page of provider named "(.*?)"$/ do |name|
  visit edit_user_provider_path @user, Provider.find_by_name!(name)
end
