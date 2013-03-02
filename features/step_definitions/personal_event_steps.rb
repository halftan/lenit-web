### UTILITIES ###


### STEP DEFINITIONS ###
Given /^personal events titled (.*?)$/ do |titles|
  titles.tr! '"', ''
  titles.split(', ').each do |title|
    @user.personal_events.create! :name => title
  end
  @from = titles
end

Given /^I am on the show page of the personal event named "(.*?)"$/ do |name|
  visit user_personal_event_path(@user, @user.personal_events.find_by_name(name))
end





When /^I go to the list of personal events$/ do
  visit user_personal_events_path(@user)
end




Then /^there are (\d+) personal events$/ do |count|
  @user.personal_events.count.should eql count.to_i
end