Feature: User can log in to the website
  
Scenario: Log in
  Given I am on the Books For Aggies signup page
  When I click "Sign Up"
  And I put "JohnSmith" in "Name"
  And I put "test@example.com" in "Email"
  And I put "123" in "Password"
  And I put "123" in "Password"
  And I press "signup"
  Then I should be logged in as "JohnSmith"