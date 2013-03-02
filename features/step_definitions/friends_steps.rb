When /^I visit the show page of "(.*?)" whose ([^ ]*?) is "(.*?)"$/ do |model, field, value|
  visit send("#{model.downcase}_path", eval(model.singularize.capitalize).send(:where, field.to_sym => value).first.id)
end

Given /^([^ ]*?) whose ([^ ]*?) is "(.*?)" follows "(.*?)"$/ do |model, field, one, other|
  model = eval(model.capitalize)
  model.where(field.to_sym => one).first.follow! model.where(field.to_sym => other).first
end

When /^I visit the list of my followed users$/ do
  visit user_followeds_path @user
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