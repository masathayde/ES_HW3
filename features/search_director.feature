Feature: search movies by director

    As an avid moviegoer
    So that I can quickly find movies by my favorite director
    I want to see all movies by the same director as a chosen movie

Background: movies have been added to database

    Given the following movies exist:
    | title                   | rating | release_date | director |
    | Aladdin                 | G      | 25-Nov-1992  ||
    | The Terminator          | R      | 26-Oct-1984  | Jake     |
    | When Harry Met Sally    | R      | 21-Jul-1989  | Chris    |
    | The Help                | PG-13  | 10-Aug-2011  | Ted      |
    | Chocolat                | PG-13  | 5-Jan-2001   | Alan     |
    | Amelie                  | R      | 25-Apr-2001  | Alan     |
    | 2001: A Space Odyssey   | G      | 6-Apr-1968   | Jake     |
    | The Incredibles         | PG     | 5-Nov-2004   | Ted      |
    | Raiders of the Lost Ark | PG     | 12-Jun-1981  | Chris    |
    | Chicken Run             | G      | 21-Jun-2000  | Martha   |

    And I am on the RottenPotatoes home page
    And I check all ratings
    And I press "ratings_submit"

Scenario: add or edit director information to a movie

    When I follow "More about Aladdin"
    And I follow "Edit"
    And I fill in "Director" with "Teresa"
    And I press "Update Movie Info"
    Then I should see "Directed by: Teresa"

Scenario: find movies by the same director

    When I follow "More about The Terminator"
    And I follow "Find other movies by the same director"
    Then I should see a list of movies by "Jake"
    And I follow "Back to movie list"
    And I follow "More about Chocolat"
    And I follow "Find other movies by the same director"
    Then I should see a list of movies by "Alan"

Scenario: trying to find movies when there's no director (sad path)

    When I follow "More about Aladdin"
    And I follow "Find other movies by the same director"
    Then I should be on the RottenPotatoes home page
    And I should see "The selected movie doesn't have a valid director"