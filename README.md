##Project Manager

This site is able to manage projects that someone is currently working on or plans to.
Currently the site handles only basic information about projects. Additionally, there is an authentication system with admin and user credentials. The User login has read-only access.

####Version
- Ruby version 2.2
- Rails version 4.2

####Database
Using the sqlite3 database default in rails.

####Test Suite
None at the moment

####Deployment Instructions
While in the root folder of the project:
1. Setup the database:`rake db:create db:setup`
2. Then run `rails server` to start the server and access the page on http://localhost:3000
