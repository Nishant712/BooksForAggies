Feature: User can search for a book in the database
  
Scenario: Find book by title
  Given I am on the Books for Aggies Find page
  When I put "TestTitle" in "search"
  And I press "Submit"
  Then I should be on the results page for "TestTitle"