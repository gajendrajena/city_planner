# frozen_string_literal: true

# Road class
class Road
  attr_accessor :point_a, :point_b

  def initialize(point_a, point_b)
    @point_a = point_a
    @point_b = point_b
  end
end
