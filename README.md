# Offers App
This is a small web application that displays offers to users as a hiring test for lemoney.

### Ruby version
```
2.6.5
```

### Rails version
```
6.0.3
```

### Configuration
```shell
bundle install
yarn install
```

### Database creation
```shell
bundle exec rails db:setup
or
bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails db:seed
```

#### For The Tests

```shell
bundle exec rails db:setup RAILS_ENV=test
or
bundle exec rails db:create
bundle exec rails db:migrate RAILS_ENV=test
bundle exec rails db:seed RAILS_ENV=test
```

### How to run the test suite
```shell
bundle exec rspec
```

### Run the server
```shell
bundle exec rails server
```

# Documentation
## Features
- only admins can create, edit and delete offers
- when offer is created is disable by default
- the offer is active when current date is between `starts_at` and `ends_at`
- even if the offer is activated over time, the admin can disable it

## Login

- Admin
```
email: 'admin@email.com'
password: 'admin@email.com'
```

- User
```
email: 'user@email.com'
password: 'user@email.com'
```
## Pages
- Home: `http://localhost:3000`
- Create User: `http://localhost:3000/users/sign_up`
- Login: `http://localhost:3000/users/sign_in`
- Create Offer: `http://localhost:3000/offers/new`
- Manage Offers: `http://localhost:3000/offers`
