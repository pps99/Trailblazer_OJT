# README

## Environment

- Ruby 2.7.2
- Docker
- Ruby on Rails 6.0.5
- Mysql 8.0

#### Step1 Clone this project

```bash
git clone https://github.com/SiThuBo/Trailblazer_rails.git
```

#### Step2 Start development environment using docker-compose

```bash
# Create Docker image from Dockerfile
docker-compose build

# Temporarily start the web container and access it with bash
docker-compose run --rm web bash

# Node module installation
bin/yarn install

# Database setup
bin/db:create
bin/db:migrate

# Install simple_form
rails generate simple_form:install

# End access to app container
exit

# Gem Install
* run: bundle install

# Project Setup to run db:seed
* delete these two lines in user.rb (temporarily)
    * belongs_to :created_user, class_name: 'User', foreign_key: 'create_user_id'
    * belongs_to :updated_user, class_name: 'User', foreign_key: 'updated_user_id'

* run: rails db:seed

* add these two lines back in user.rb
    * belongs_to :created_user, class_name: 'User', foreign_key: 'create_user_id'
    * belongs_to :updated_user, class_name: 'User', foreign_key: 'updated_user_id'


# Start docker-compose services
docker-compose up -d
```
All you have to do is access `http: // localhost: 3000`.
