require 'capybara'
require 'selenium-webdriver'

Given("I am on the Books For Aggies share page") do
  expect(page).to have_current_path('/')
  visit(book_index_path)
end

When("I fill all the book fields correctly") do
  fill_in 'title', :with => 'Introduction to Algorithms'
  fill_in 'author', :with => 'Thomas H. Cormen, Charles E. Leiserson, Ronald Rivest, Clifford Stein'
  fill_in 'edition', :with => '3rd'
  fill_in 'cid', :with => 'CSCE-629'
  fill_in 'isbn', :with => '978-0-262-03384-8'
  fill_in 'msg', :with => 'Test' 
end

When("I press {string}") do |string|
  click_button(string)
end

Then("I should still be on the Books For Aggies share page") do
   expect(page).to have_current_path('/book/index?title=Introduction+to+Algorithms&author=Thomas+H.+Cormen%2C+Charles+E.+Leiserson%2C+Ronald+Rivest%2C+Clifford+Stein&edition=3rd&cid=CSCE-629&isbn=978-0-262-03384-8&msg=Test&Submit=Share')
end

Then("The {string} field should contain {string}") do |string, string2|
   page.find_field(string).value == string2
end