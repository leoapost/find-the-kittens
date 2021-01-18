# frozen_string_literal: true

RSpec.describe ForensicsApiClient do
  let(:api_client) { described_class.new }

  describe '#fetch_instructions' do
    it 'returns the direction results' do
      results = { 'directions' => ['forward', 'right', 'forward', 'forward', 'forward', 'left'] }

      stub_directions_wirth_results(results)

      expect(api_client.fetch_instructions).to eq results['directions']
    end
  end

  describe '#search_location' do
    context 'when successful recovery' do
      it 'return success message' do
        results = { 'message' => 'Congratulations! The search party successfully recovered the missing kittens.' }
        x = 5
        y = 2

        stub_location_with_result(x, y, results)

        expect(api_client.search_location(x, y)).to include('Congratulations')
      end
    end
  end
end

def stub_directions_wirth_results(results)
  stub_request(:get, 'http://which-technical-exercise.herokuapp.com/api/leoapost@gmail.com/directions')
    .to_return(body: results.to_json, status: 200, headers: { 'Content-Type' => 'application/json' })
end

def stub_location_with_result(_x, _y, results)
  stub_request(:get, 'http://which-technical-exercise.herokuapp.com/api/leoapost@gmail.com/location/5/2')
    .to_return(body: results.to_json, status: 200, headers: { 'Content-Type' => 'application/json' })
end
