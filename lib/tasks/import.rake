# frozen_string_literal: true

namespace :import do
  desc 'Import Heart Rate data into postgres'
  task :heart_rate, [:environment]  do |_t, args|
    require 'date'
    require 'json'
    require 'logger'
    require 'require_all'
    require 'sequel'

    APP_ENV = args[:environment] || 'd' unless defined?(APP_ENV)

    require_relative '../../config/database'
    require_relative '../../helpers/parsable'
    require_relative '../../models/heart_rate'
    require_all 'importers/heart_rate'

    HR::Import.new.import
  end
end
