Given(/^I am on the hompage$/) do
	visit('/')
end

When(/^I follow "(.*?)"$/) do |new_game|
click_link(new_game)
end

Then(/^I should see "(.*?)"$/) do |arg1|
page.has_content?(arg1)
end