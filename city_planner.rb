# frozen_string_literal: true
require './lib/road'

# city planner
class CityPlanner
  attr_accessor :roads

  def initialize
    @roads = []
  end

  def build_road(point_a, point_b)
    return nil if point_a.nil? || point_b.nil?

    road = Road.new(point_a, point_b)
    @roads << road
    road
  end

  def exists(point_a, point_b)
    # direct roads
    direct_road = @roads.select { |r| r.point_a == point_a && r.point_b == point_b }
    return true if !direct_road.empty?

    # roads with one point in common
    roads = @roads.collect{ |r| r if r.point_a == point_a || r.point_b == point_b }.compact
    return roads[0].point_b == roads[1].point_a if roads.length == 2

    roads_with_point_a = roads.select{|r| r.point_a == point_a}
    roads_with_point_b = roads.select{|r| r.point_b == point_b}

    roads_with_point_a.each do |starting_point_road|
      roads_with_point_b.each do |ending_point_road|
        return true if exists(starting_point_road.point_b, ending_point_road.point_a)
      end
    end

    false
  end
end
