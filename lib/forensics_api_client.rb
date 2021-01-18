# frozen_string_literal: true

require 'net/http'
require 'json'

##
# Client for the Forensic API
#
class ForensicsApiClient
  API_URL = 'http://which-technical-exercise.herokuapp.com/api/leoapost@gmail.com'

  ##
  # Fetches the instructions from the /directions endpoint
  # and parses the json to extract the directions
  #
  # @return [Array] list of the directions
  #
  def fetch_instructions
    response = make_request(directions_uri)
    parsed_data = parse_data(response.body)

    parsed_data['directions']
  end

  ##
  # Sends a request in the /location endpoint with a location
  # to confirm it is the location with the missing kittens
  #
  # @return [String] the message of the results
  #
  def search_location(x, y)
    response = make_request(location_uri(x, y))
    parsed_data = parse_data(response.body)

    parsed_data['message']
  end

  private

  def directions_uri
    URI("#{API_URL}/directions")
  end

  def location_uri(x, y)
    URI("#{API_URL}/location/#{x}/#{y}")
  end

  def parse_data(data)
    JSON.parse(data)
  end

  def make_request(uri)
    Net::HTTP.get_response(uri)
  end
end
