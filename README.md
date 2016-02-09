![](https://travis-ci.org/BWieber/Blocmarks.svg?branch=master)

# Blocmarks

Blocmarks is a social bookmarking app that allows users to email, manage and share bookmarked URLs. Using the mailgun API, users can send an email to a specific address to have a data be created and categorized.

The app is deployed on Heroku: https://bwieber-blocmarks.herokuapp.com

The source code is here on GitHub: https://github.com/BWieber/Blocmarks

This app was created as part of the [Bloc](www.bloc.io) Full Stack Web Development course.

# Features

+ Users can create a standard account in order to create, edit, and collaborate on public topics which have a list of bookmarks. Anyone can add a bookmark to a particular topic.
+ Users can email Blocmarks to create topics and bookmarks via postmaster@app088d023c61fd4c2eaf20a535e1147a4e.mailgun.org. Blocmarks will parse the data in the email. If you are not yet a user, Blocmarks will create a new user with a default password of 'blocmarks2016'. Blocmarks will search your subject to determine the topic title and the email body for the bookmark url. If no topic exists, it will create one. If the topic does exist it will add the new url to that topic.
+ Users can like bookmarks, with a list of their created and liked bookmarks on their user profile page.


# Setup and Configuration

**Languages and Frameworks**: Ruby on Rails and Bootstrap

**Ruby version 2.2.1**

**Databases**: SQLite (Test, Development), PostgreSQL (Production)

**Development Tools and Gems include**:

+ Devise for user authentication
+ Mailgun for email confirmation and API
+ Pundit for authorization
+ Faker and Factory Girl for test suite success

**Setup:**

+ Environment variables were set using Figaro and are stored in config/application.yml (ignored by git).

+ The config/application.example.yml file illustrates how environment variables should be stored.

**To run Blocmarks locally:**

+ Clone the repository
+ Run bundle install
+ Create and migrate the SQLite database with `rake db:create` and `rake db:migrate`
+ Start the server using `rails server`
+ Run the app on `localhost:3000`
