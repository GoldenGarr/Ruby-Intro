class Vector
  attr_reader :data


  def initialize(data)
    @data = data
  end

  def add(other)
    if other.data.length != @data.length
      nil
    end

    (0..data.length - 1).each { |i|
      data[i] += other.data[i]
    }
  end

  def norm
    res = 0
    data.each{ |elem| res += elem ^ 2 }

    Math.sqrt(res)
  end

  # def data
  #   @data
  # end
end

vec = Vector.new([1, 2, 3, 4])
other = Vector.new([0, 2, 3, 4])

# p vec.norm
vec.add(other)
p vec.data
