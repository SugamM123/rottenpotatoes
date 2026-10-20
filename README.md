# RottenPotatoes - CSCE 606 (hw-hello-rails)

This is the RottenPotatoes rails app for hw-hello-rails in CSCE 606.

Heroku app url: https://rottenpotatoes-sugam-5f8c7210c73c.herokuapp.com/

## Tech details
- Ruby version: 3.4.7
- Rails version: 8.1.4
- Database: PostgreSQL for dev and Heroku production

## Setup & Running locally

1. Install dependencies:
```bash
bundle install
```

2. Setup database and seed movies:
```bash
bin/rails db:migrate
bin/rails db:seed
```

3. Start server:
```bash
bin/rails server
```
Then go to `http://localhost:3000` (it redirects `/` to `/movies`).

## Features implemented
- Movies model with migration and starter seed data.
- Full CRUD routes and views using scaffold controller.
- Sortable movie table by Title, Rating, and Release Date.
  - Clicking on a header toggles between ascending and descending sort.
  - Sorted column is highlighted and shows an arrow indicator.
  - Last chosen sort is remembered in session so it stays when coming back.
- Deployed on Heroku with postgres add-on.
