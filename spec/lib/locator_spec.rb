# frozen_string_literal: true

RSpec.describe Locator do
  describe '#locate' do
    it 'follows the instructions to locate the kittens' do
      instructions = ['forward', 'right', 'forward', 'left', 'forward']
      locator = described_class.new(instructions)

      expect(locator.locate).to eq [1, 2]
    end
  end
end
