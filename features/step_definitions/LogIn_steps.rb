require 'capybara'
require 'selenium-webdriver'


Given("I am on the Books For Aggies signup page") do
  visit(users_path)
  expect(page).to have_current_path('/users')
end

When("I put {string} in {string}") do |string, field|
  fill_in field, :with => string
end

When("I click {string}") do |string|
  click_link(string)
end

Then("I should be logged in as {string}") do |string|
    expect(page).to have_current_path('/?user_name='+string)
end