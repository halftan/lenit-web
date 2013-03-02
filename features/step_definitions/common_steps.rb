
Given /^I logged in$/ do
  create_user
  sign_in
  load "#{Rails.root}/db/test_seeds.rb"
end

Given /^I am on my homepage$/ do
  visit user_path(@user)
end

Given /^I have role "(.*?)"$/ do |role|
  unless @user.has_role? role
    _role = Role.find_by_name!(role)
    @user.add_role role
  end
end

Given /^I have not role "(.*?)"$/ do |role|
  if @user.has_role? role
    @user.remove_role role
  end
end

Given /^the following "(.*?)"$/ do |factory, table|
  load "#{Rails.root}/db/test_seeds.rb"
  table.hashes.each do |hash|
    FactoryGirl.create factory, hash
  end
end



When /^I visit my homepage$/ do
  visit user_url @user
end

When /^I visit the homepage$/ do
  if @user
    visit user_path @user
  else
    visit '/'
  end
end

Then /^I should have (\d+) "(.*?)"$/ do |count, model|
  @user = User.find @user.id
  begin
    (@user.send model).count.should eql count.to_i
  rescue NoMethodError => e
    throw e if model.pluralize == model
    model = model.pluralize
    retry
  end
end