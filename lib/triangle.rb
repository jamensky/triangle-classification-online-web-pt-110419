class Triangle
  attr_accessor :measure_1, :measure_2, :measure_3, :kind

  def initialize(measure_1, measure_2, measure_3)
     @measure_1 = measure_1
     @measure_2 = measure_2
     @measure_3 = measure_3
  end

  def kind
    multiples = []
    all_measures = [@measure_1, @measure_2, @measure_3]
    all_measures.each{|measure| multiples << all_measures.count(measure)}

     if all_measures.all?{|measure| measure == 0} || all_measures.any?{|measure| measure < 0}
      raise TriangleError
    else
      if multiples.include?(3)
        self.kind = :equilateral
      elsif multiples.include?(2)
        self.kind = :isosceles
      elsif multiples.include?(1)
        self.kind = :scalene
      end

    else
      raise TriangleError
    end
  end

  class TriangleError < StandardError
  end


end
