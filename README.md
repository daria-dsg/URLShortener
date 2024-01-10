# URL Shortener
Command line tool that take an arbitrarily-long URL and shorten it for the user generated in base64 encoding. 

#### Learning Goals
* Be able to change the database using migrations
* Be able to write both database constraints and model-level validations
* Be able to write associations
* Understand the purpose of adding an index to columns in our database

#### Features
* Creating a user with an email
* Signing up the user with an email
* Tracking how many times URL was visited 
* Tracking how many unique clicks on a URL in a recent period of time wera made
* Assigning tags to the URL
* Checking the 5 most popualar links
* Providing custom validations to prevent users from submitting more than 5 URLs in a single minute
* Monetizing the app by limiting the number of total URLs non-premium users can submit to 5

