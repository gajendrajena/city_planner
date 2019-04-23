# frozen_string_literal: true

require './lib/road'

describe Road do
  describe '.initialize' do
    let(:road) { Road.new('A', 'B') }

    it 'returns true after building the road' do
      expect(road.point_a).to eq('A')
      expect(road.point_b).to eq('B')
    end
  end
end
