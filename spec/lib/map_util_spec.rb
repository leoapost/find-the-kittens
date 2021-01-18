# frozen_string_literal: true

RSpec.describe MapUtil do
  describe '.determine_direction' do
    it 'determines which direction to face' do
      expect(described_class.determine_direction('north', 'right')).to eq 'east'
    end
  end

  describe '.determine_fwd_coords' do
    it 'determines the next coordinates when moving forward towards a direction' do
      expect(described_class.determine_fwd_coords([2, 2], 'east')).to eq [3, 2]
    end
  end
end
