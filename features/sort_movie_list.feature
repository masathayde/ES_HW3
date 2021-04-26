
Feature: display list of movies sorted by different criteria
 
  As an avid moviegoer
  So that I can quickly browse movies based on my preferences
  I want to see movies sorted by title or release date

Background: movies have been added to database
  
  Given the following movies exist:
    | title                   | rating | release_date | director |
    | Aladdin                 | G      | 25-Nov-1992  | Alex     |
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

Scenario: sort movies alphabetically
  When I follow "Movie Title"
  Then I should see "Aladdin" before "Amelie"

Scenario: sort movies in increasing order of release date
  When I follow "Release Date"
  Then I should see "2001: A Space Odyssey" before "The Incredibles"