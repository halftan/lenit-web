Given /^I have provider named "(.*?)"$/ do |name|
  @user.providers.create! :name => name
end

Given /^I am on the show page of the provider named "(.*?)"$/ do |name|
  visit user_provider_url(@user, Provider.find_by_name!(name))
end

Given /^provider "(.*?)" has event named "(.*?)" and location "(.*?)"$/ do |provider, ename, elocation|
  Provider.find_by_name(provider).provided_events.create! name: ename, location: elocation, time: Time.now + 10.hours
end

When /^I goto the new_provider_provided_event page of provider named "(.*?)"$/ do |name|
  visit new_provider_provided_event_path Provider.find_by_name!(name)
end

When /^I am on the show page of the provided_event named "(.*?)"$/ do |name|
  visit provider_provided_event_path @user.providers.first, ProvidedEvent.find_by_name(name)
end