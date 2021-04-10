require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

module WithinHelpers
  def with_scope(locator)
    locator ? within(*selector_for(locator)) { yield } : yield
  end
end
World(WithinHelpers)

Given ('the following movies exist:') do |table|
    table.hashes.each do |movie|
      Movie.create!(movie)
    end
end

Given(/^I check all ratings$/) do
    fields = %w(G PG PG-13 NC-17 R)
    fields.each do |field|
        check("ratings[#{field}]")
    end
end

Given(/^I uncheck the following ratings: (.*)$/) do |text|
  ratings = text.gsub(' ', '').split(',');
  ratings.each do |rating|
    uncheck(%{ratings[#{rating}]})
  end
end

Given(/^I check the following ratings: (.*)$/) do |text|
  ratings = text.gsub(' ', '').split(',');
  ratings.each do |rating|
    check(%{ratings[#{rating}]})
  end
end

Then('I should see all of the movies') do
  movies = [{:title => 'Aladdin', :rating => 'G', :release_date => '25-Nov-1992'},
    	  {:title => 'The Terminator', :rating => 'R', :release_date => '26-Oct-1984'},
    	  {:title => 'When Harry Met Sally', :rating => 'R', :release_date => '21-Jul-1989'},
      	  {:title => 'The Help', :rating => 'PG-13', :release_date => '10-Aug-2011'},
      	  {:title => 'Chocolat', :rating => 'PG-13', :release_date => '5-Jan-2001'},
      	  {:title => 'Amelie', :rating => 'R', :release_date => '25-Apr-2001'},
      	  {:title => '2001: A Space Odyssey', :rating => 'G', :release_date => '6-Apr-1968'},
      	  {:title => 'The Incredibles', :rating => 'PG', :release_date => '5-Nov-2004'},
      	  {:title => 'Raiders of the Lost Ark', :rating => 'PG', :release_date => '12-Jun-1981'},
      	  {:title => 'Chicken Run', :rating => 'G', :release_date => '21-Jun-2000'},
  	]
  movies.each do |movie|
    text = movie[:title]
    if page.respond_to? :should
      page.should have_content(text)
    else
      assert page.has_content?(text)
    end
  end
end

Then('I should see {string} before {string}') do |string, string2|
  assert (/#{string}.*#{string2}/m =~ page.body) != nil
  assert (/#{string2}.*#{string}/m =~ page.body) == nil
end