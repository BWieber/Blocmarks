![](https://travis-ci.org/BWieber/Blocmarks.svg?branch=master)

# Blocmarks

Blocmarks is a social bookmarking app that allows users to email, manage and share bookmarked URLs. Using the mailgun API, users can send an email to a specific address to have a data be created and categorized.

The app is deployed on Heroku: https://bwieber-blocmarks.herokuapp.com

The source code is here on GitHub: https://github.com/BWieber/Blocmarks

This app was created as part of the [Bloc](www.bloc.io) Full Stack Web Development course.

# Features

+ Users can create a standard account in order to create, edit, and collaborate on public topics which have a list of bookmarks. Anyone can add a bookmark to a particular topic.


+ To use Blocmarks functionality, you simply need to send an email to postmaster@app088d023c61fd4c2eaf20a535e1147a4e.mailgun.org.
  + Important Details are as follows:
    + **Your email**: Blocmarks will search for your email it its database. If you are not yet a user, Blocmarks will create an account with your email with the default password Blocmarks2016 (remember to change it when you log in!)
    + **Email Subject**: Blocmarks will search its database for a topic with the same name. If no such topic exists, it will create a new topic with whatever you typed into the subject.
    + **Email Body**: Blocmarks will create a new bookmark with the data within. Please ensure that you use proper urls, or Blocmarks will just place a string under the topic, and no image will be generated.
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
