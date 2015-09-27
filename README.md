![Build Status](https://codeship.com/projects/<c8493ba0-0c63-0133-1fb7-46840019e268>/status?branch=master)![Code Climate](https://codeclimate.com/github/lfields90/GreaterBoston.png) ![Coverage Status](https://coveralls.io/repos/lfields90/GreaterBoston/badge.png)

**The town of Hyde Park within the city Boston is currently the only town being worked on.**

Predefined cities:
- Boston
- Brookline
- Cambridge
- Watertown
- Somerville

Category Name
- Bar
- Restaurant
- Nightclub
- Doctor's Office
- Municipality


neighborhood belongs to city
city has many neighborhoods

event belogns to neighborhood
neighborhood has many events

event belongs to category
category has many events

event belongs to user
user has many events

on the sign in page where i state
Hit the state, city, neighborhood, etc..
They should be displayed by parent id

ex. States should be displayed in alpha order because they dont belong to anything

Cities should be displayed:

- city.state.name -
all cities in that state sorted alpha

Neighborhoods should be displyed:

- neighborhood.city.name - sorted alpha
all negihborhoods in that city sorted alpha

So on and so fourth
