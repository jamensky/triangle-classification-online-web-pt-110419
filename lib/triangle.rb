class Triangle
  attr_accessor :measure_1, :measure_2, :measure_3, :kind, :measures

  @@all_triangles = []

  def initialize(measure_1, measure_2, measure_3)
      @measures = []
      @measures << @measure_1 = measure_1
      @measures << @measure_2 = measure_2
      @measures << @measure_3 = measure_3
      @@all_triangles << self
  end

  def self.all_triangles
    @@all_triangles
  end

  def multiples
    multiples = []
    self.measures.each{|measure| multiples << self.measures.count(measure)}
    multiples
  end

  def valid
    if self.measures.all?{|measure| measure == 0} || self.measures.any?{|measure| measure < 0}
      raise TriangleError
    end
  end


  def inequality
    x = self.measures.min(2)
    y = self.measures.max
    z = x[0] + x[1]
    y > z
  end


  def kind
    if self.valid || self.inequality
      raise TriangleError
    else
      if multiples.include?(3)
       self.kind = :equilateral
      elsif multiples.include?(2)
       self.kind = :isosceles
      elsif multiples.include?(1)
       self.kind = :scalene
      end
    end
  end

  class TriangleError < StandardError
  end


end
