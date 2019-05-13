## README

Run through the standard Rails setup.

```
$ bundle install
$ rake db:{create,migrate}
$ rails s
```

Navigate to `http://localhost:3000`


You will be using this documentation: https://developer.nrel.gov/docs/transportation/alt-fuel-stations-v1/nearest/

As a user
When I visit "/"
And I fill in the search form with 80206 (Note: Use the existing search form)
And I click "Locate"
Then I should be on page "/search"
Then I should see the total results of the stations that match my query, 90.
Then I should see a list of the 15 closest stations within 5 miles sorted by distance
And the stations should be limited to Electric and Propane
And the stations should only be public, and not private, planned or temporarily unavailable.
And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
