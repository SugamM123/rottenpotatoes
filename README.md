# RottenPotatoes - CSCE 606 (hw-hello-rails)

This is the RottenPotatoes rails app for hw-hello-rails in CSCE 606.

Heroku app url: https://rottenpotatoes-sugam-5f8c7210c73c.herokuapp.com/

## Tech details
- Ruby version: 3.4.7
- Rails version: 8.1.4
- Database: SQLite3 for dev, PostgreSQL for Heroku production


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

## Commands Used to Generate Project Files

1. **Initial Rails app generation**:
```bash
rails new rottenpotatoes
```
bawe Rails directory structure and boilerplate (`app/`, `config/`, `db/`, `lib/`, `vendor/`, `storage/`, etc.).

2. **Movies migration**:
```bash
bin/rails generate migration create_movies
```
migration file in `db/migrate/` for creating the `movies` table schema.

3. **Movies controller and views**:
```bash
bin/rails generate scaffold_controller Movie title rating description release_date --skip-test
```
 controller (`app/controllers/movies_controller.rb`), views (`app/views/movies/`), and helper (`app/helpers/movies_helper.rb`) for the existing `Movie` model.

## Features implemented
- Movies model with migration and starter seed data.
- Full CRUD routes and views using scaffold controller.
- Sortable movie table by Title, Rating, and Release Date.
  - Clicking on a header toggles between ascending and descending sort.
  - Sorted column is highlighted and shows an arrow indicator.
  - Last chosen sort is remembered in session so it stays when coming back.
- Deployed on Heroku with postgres add-on.
