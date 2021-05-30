# frozen_string_literal: true

# methods that parse various data collections to a ruby object
module Parsable
  def json(file)
    JSON.parse(File.read(file))
  end
end
