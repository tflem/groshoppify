[![CircleCI](https://circleci.com/gh/tflem/groshoppify.svg?style=svg&circle-token=b8eae17d601ac6be85ba879047590a06f1a787ef)](<https://app.circleci.com/pipelines/github/tflem/groshoppify>)
[![Maintainability](https://api.codeclimate.com/v1/badges/f8f46325db298ebd6193/maintainability)](https://codeclimate.com/github/tflem/groshoppify/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/f8f46325db298ebd6193/test_coverage)](https://codeclimate.com/github/tflem/groshoppify/test_coverage)

# Groshoppify

> This a product tracking application, developed with the following:

* Ruby 2.7.2
* Docker 20.10.3 and Docker Compose 1.28.2
* Continuous Integration/Deployment: Circle CI and Heroku
* Ruby on Rails 6.1.2.1
* HTML5 and Sass
* PostgreSQL 12.2
* Testing Framework: RSpec 4.0
* Bootstrap 5

## Setup

How to run tests:

```
% rspec spec
```

How to run the development console:

```
% rails console
```

How to run the development server:

```
% rails server
```

How to prepare (create and migrate) DB for `development` and `test` environments:

```
% rails db:create

% rails db:migrate
```

A staged demo can be viewed at http://groshoppify.herokuapp.com.
