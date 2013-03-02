When /^I visit the show page of "(.*?)" whose ([^ ]*?) is "(.*?)"$/ do |model, field, value|
  visit send("#{model.downcase}_path", eval(model.singularize.capitalize).send(:where, field.to_sym => value).first.id)
end

Given /^([^ ]*?) whose ([^ ]*?) is "(.*?)" follows "(.*?)"$/ do |model, field, one, other|
  model = eval(model.capitalize)
  model.where(field.to_sym => one).first.follow! model.where(field.to_sym => other).first
end

Given(/^User whose name is "(.*?)" adds personal_event name "(.*?)" and location "(.*?)"$/) do |uname, ename, elocation|
  User.find_by_name(uname).personal_events.create! name: ename, location: elocation
end

When /^I visit the list of my followed users$/ do
  visit followed_user_path @user
end


Then /^([^ ]*?) whose ([^ ]*?) is "(.*?)" should have (\d+) "(.*?)"$/ do |model, field, value, count, attri|
  model = eval(model.capitalize)
  begin
    model.where(field.to_sym => value).first.send(attri).count.should eq count.to_i
  rescue NoMethodError => e
    attri = attri.pluralize
    puts "Retry: #{attri}"
    retry
  end
end