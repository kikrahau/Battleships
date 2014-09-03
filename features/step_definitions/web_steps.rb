Given(/^I am on the hompage$/) do
	visit('/')
end

When(/^I follow "(.*?)"$/) do |new_game|
click_link(new_game)
end

Then(/^I should see "(.*?)"$/) do |content_question|
page.has_content?(content_question)
end

When(/^I fill "(.*?)" with "(.*?)"$/) do |field, value|
fill_in(field, :with => value)
end

When(/^I press "(.*?)"$/) do |go|
click_button(go)
end
