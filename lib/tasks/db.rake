# frozen_string_literal: true

namespace :db do
  desc 'Migrate dev database up'
  task :migrate_dev do
    sh 'sequel -m db/migrations postgres://postgres:password@localhost/me_dev'
  end

  desc 'Migrate test database up'
  task :migrate_test do
    sh 'sequel -m db/migrations postgres://postgres:password@localhost/me_test'
  end
end
