# frozen_string_literal: true

##
# Map Utility class to help with the hemisphere directions
# and determining coordinates when moving towards a direction
#
class MapUtil
  HEMISPHERE_MAP = {
    'north' => { 'right' => 'east', 'left' => 'west' },
    'east' => { 'right' => 'south', 'left' => 'north' },
    'south' => { 'right' => 'west', 'left' => 'east' },
    'west' => { 'right' => 'north', 'left' => 'south' }
  }.freeze

  ##
  # Determine which hemisphere direction should face
  #
  # @param direction [String] the direction currently facing (e.g 'north')
  # @param turn [String] where to turn (i.e. 'right' or 'left')
  #
  # @return [String] the new direction
  #
  def self.determine_direction(direction, turn)
    HEMISPHERE_MAP[direction][turn]
  end

  ##
  # Determine the next coordinates when moving forward towards a direction
  #
  # @param coords [Array] the x, y coordinates to move from
  # @param facing [String] the hemisphere direction moving to
  #
  # @return [Array] x, y coordinates
  #
  def self.determine_fwd_coords(coords, facing)
    x, y = coords

    return [x, y + 1] if facing == 'north'
    return [x, y - 1] if facing == 'south'
    return [x + 1, y] if facing == 'east'
    return [x - 1, y] if facing == 'west'
  end
end
