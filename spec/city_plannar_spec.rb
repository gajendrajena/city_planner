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
      let (:city_planer) { CityPlanner.new }

      it 'returns true after building the road' do
        expect(city_planer.build_road(0, 1)).to be_instance_of(Road)
      end
    end

    context 'when road params are invalid' do
      let (:city_planer) { CityPlanner.new }
      it 'returns nil if arguments are nil' do
        expect(city_planer.build_road(nil, nil)).to be_nil
      end
    end
  end

  describe '#exists' do
    before do
      city_planer.build_road(0, 1)
    end

    context 'direct road' do
      let (:city_planer) { CityPlanner.new }

      it 'returns true for one direct road' do
        expect(city_planer.exists(0, 1)).to eq(true)
      end
    end

    context 'indirect road' do
      it 'returns true for indirect roads with one point in common' do
        city_planer.build_road(1, 2)

        expect(city_planer.exists(0, 2)).to eq(true)
      end

      let (:city_planer) { CityPlanner.new }
      before do
        city_planer.build_road(0, 2)
        city_planer.build_road(1, 2)
        city_planer.build_road(2, 4)
        city_planer.build_road(3, 5)
        city_planer.build_road(5, 6)
        city_planer.build_road(4, 6)
      end

      it 'returns true' do
        expect(city_planer.exists(0, 4)).to eq(true)
      end

      it 'returns true' do
        expect(city_planer.exists(0, 6)).to eq(true)
      end

      it 'returns false' do
        expect(city_planer.exists(2, 5)).to eq(false)
      end

      it 'returns false' do
        expect(city_planer.exists(0, 5)).to eq(false)
      end
    end
  end
end
