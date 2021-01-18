# frozen_string_literal: true

##
# This class locates the lost kittens based on the instructions
# found in the evidences
#
class Locator
  attr_reader :instructions

  ##
  # Creates a locator instance with the instructions to follow, from a starting
  # point and starting facing direction
  #
  # @param instructions [Array] the instructions to follow
  # @param direction [String] starting direction. Default to 'north'
  # @param starting_point [Array] x, y coordinates. Default to [0, 0]
  #
  def initialize(instructions, direction = 'north', starting_point = [0, 0])
    @instructions = instructions

    @direction = direction
    @coordinates = starting_point
  end

  ##
  # Follows the instructions to locate the kittens
  #
  # @return [Array] the final x, y coordinates
  def locate
    instructions.each do |instruction|
      if instruction == 'forward'
        @coordinates = MapUtil.determine_fwd_coords(@coordinates, @direction)
      else
        @direction = MapUtil.determine_direction(@direction, instruction)
      end
    end

    @coordinates
  end
end
