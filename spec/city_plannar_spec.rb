# frozen_string_literal: true

require './city_planner'
require './lib/road'

describe CityPlanner do
  describe '.initialize' do
    it 'initializes roads with []' do
      city_planer = CityPlanner.new
      expect(city_planer.roads).to eq([])
    end
  end

  describe '#build_road' do
    context 'when road params are valid' do
      let(:city_planer) { CityPlanner.new }

      it 'returns true after building the road' do
        expect(city_planer.build_road(0, 1)).to be_instance_of(Road)
      end
    end

    context 'when road params are invalid' do
      let(:city_planer) { CityPlanner.new }
      it 'returns nil if arguments are nil' do
        expect(city_planer.build_road(nil, nil)).to be_nil
      end
    end
  end

  describe '#exists' do
    let(:cp) { CityPlanner.new }
    before do
      arr = [[0, 1], [0, 2], [1, 2], [2, 4], [3, 5], [5, 6], [4, 6]]
      arr.each { |a| cp.build_road(a[0], a[1]) }
    end
    it 'returns true when a direct road exists between point 0 and 1' do
      expect(cp.exists(0, 1)).to eq(true)
    end

    context 'when indirect road exists' do
      it 'returns true for points 0 and 2' do
        expect(cp.exists(0, 2)).to eq(true)
      end

      it 'returns true for points 0 and 4' do
        expect(cp.exists(0, 4)).to eq(true)
      end

      it 'returns true for points 0 and 6' do
        expect(cp.exists(0, 6)).to eq(true)
      end
    end

    context 'when indirect road does not exist' do
      it 'returns false for points 2 and 5' do
        expect(cp.exists(2, 5)).to eq(false)
      end

      it 'returns false for points 0 and 5' do
        expect(cp.exists(0, 5)).to eq(false)
      end
    end
  end
end
