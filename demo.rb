# frozen_string_literal: true

Dir[File.join(__dir__, 'lib', '*.rb')].sort.each { |file| require file }

api_client = ForensicsApiClient.new
directions = api_client.fetch_instructions

locator = Locator.new(directions)
x, y = locator.locate

results = api_client.search_location(x, y)

puts results
