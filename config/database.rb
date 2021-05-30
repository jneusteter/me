# frozen_string_literal: true

Sequel.default_timezone = :utc

module Sequel
  class Model
    alias save! save
  end
end

dev = {
  adapter: 'postgresql',
  host: 'localhost',
  user: 'postgres',
  password: 'password',
  database: 'me_dev'
}

test = {
  adapter: 'postgresql',
  host: 'localhost',
  user: 'postgres',
  password: 'password',
  database: 'me_test'
}

prod = {
  adapter: 'postgresql',
  host: 'localhost',
  user: ENV['POSTGRES_USER'],
  password: ENV['POSTGRES_PASSWORD'],
  database: ENV['ME_DATABASE']
}

DB = case APP_ENV
     when 'd'
       Sequel.connect(dev, loggers: [Logger.new($stdout)])
     when 't'
       Sequel.connect(test)
     when 'p'
       Sequel.connect(prod)
     end
