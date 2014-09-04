Given(/^I am on the hompage$/) do
	visit('/')
end

When(/^I follow "(.*?)"$/) do |new_game|
	click_link(new_game)
end

Then(/^I should see "(.*?)"$/) do |content_question|
	expect(page).to have_content(content_question)
end

When(/^I fill "(.*?)" with "(.*?)"$/) do |field, value|
	fill_in(field, :with => value)
end

When(/^I press "(.*?)"$/) do |go|
	click_button(go)
end

Given(/^I am on the new game page$/) do
  visit("/new_game") # express the regexp above with the code you wish you had
end

Then(/^I should not see "(.*?)"$/) do |content_question|
	expect(page).to_not have_content(content_question)
end

Given(/^"(.*?)" has registered$/) do |name1|
	register_player(name1)
	visit("/new_game")
end

Given(/^"(.*?)" and "(.*?)" have registered$/) do |name1, name2|
	register_player(name1)
	register_player(name2)
	visit("/new_game")
end

def register_player(name)
	visit('/')
	visit("/new_game")
	fill_in("name-input", :with => name)
	click_on("Go!")
end