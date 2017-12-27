Feature: User can add a book to the database
  
Scenario: Add a book
  Given I am on the Books For Aggies share page
  When I fill all the book fields correctly
  And I press "Submit"
  Then I should still be on the Books For Aggies share page
  And The "title" field should contain ""