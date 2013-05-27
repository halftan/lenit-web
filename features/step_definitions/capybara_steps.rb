When /^I follow the "(.*?)" link$/ do |locator|
  if locator.start_with? '.', '#'
    find(locator).click
  else
    click_on locator
  end
end

When /^I fill in "(.*?)" with "(.*?)"$/ do |field, content|
  # save_and_open_page
  fill_in field, :with => content
end

When /^I click "(.*?)"$/ do |locator|
  if locator.start_with? '.', '#'
    find(locator).click
  else
    click_on locator
  end
#  save_and_open_page
end

When /^I click on "([^"]*?)"$/ do |locator|
  # save_and_open_page
  if locator.start_with? '.', '#'
    find(locator).click
  else
    click_on locator
  end
end

When /^I click on "(.*?)" within "(.*?)"$/ do |locator, field|
  # save_and_open_page
  within field do
    if locator.start_with? '.', '#'
      find(locator).click
    else
      click_on locator
    end
  end
end

When /^I (login|signin) as "(.*?)" with password "(.*?)"$/ do |action, email, password|
  visit '/users/sign_in'
  fill_in "Email", :with => email
  fill_in "Password", :with => password
  click_button "Sign in"
  @user = User.find_by_email! email
end


Then /^I should see "(.*?)"$/ do |contents|
  save_and_open_page
  contents.tr! '"', ''
  contents.split(', ').each do |content|
    page.should have_content content
  end
end

Then /^I should not see "(.*?)"$/ do |contents|
  contents.tr! '"', ''
  contents.split(', ').each do |content|
    page.should_not have_content content
  end
end

Then /^Input "(.*?)" should( not)? have value "(.*?)"$/ do |locator, flag, value|
  unless flag
    find_field(locator).value.should eq value
  else
    find_field(locator).value.should_not eq value
  end
end
