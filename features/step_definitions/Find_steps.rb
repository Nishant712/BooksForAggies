require 'capybara'
require 'selenium-webdriver'

Given("I am on the Books for Aggies Find page") do
  visit(find_index_path)
  expect(page).to have_current_path('/find')
end

Then("I should be on the results page for {string}") do |string|
   expect(page).to have_current_path('/find?search='+string)
end