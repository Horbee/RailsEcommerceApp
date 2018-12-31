# eCommerce Web-Application

This application is created by me during my CareerFoundry course. This is a simple webshop using ordinary
features which can be found in most webshop applications.

## Technologies

* Ruby 2.5.1
* Rails 5.2.1
* [React-rails](https://github.com/reactjs/react-rails) - The App is using React components for the shopping cart.
* [Redux](https://github.com/reduxjs/redux) - A state container for our components.
* [GraphQL](http://graphql.org).
* [Graphiql](https://github.com/graphql/graphiql) - Graphiql is an in-browser IDE for exploring GraphQL.
* SQLite3 for development and PostgreSQL for production.

## Features

* CRUD (create / read / update / delete) on products
* Creating / deleting comments on product page
* Real-time updates with ActionCable when a user posts a new comment
* Creating orders with and payments with Stripe
* Pagination on comments listing
* Searching on products
* Authentication with Devise and authorizations (users, admins)
* Creating user account
* Update user profile (incl. avatar image saved on Amazon S3) and changing password
* Sending E-mails
* Application ready for production

The Website can be reached with the following link:
https://ecommercehornortest.herokuapp.com/