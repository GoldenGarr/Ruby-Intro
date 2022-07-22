class Vector
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def add(other)
    result = clone_vector(self)
    (0..data.length - 1).each { |i|
      result.data[i] += other.data[i]
    }

    result
  end

  def subtract(other)
    result = clone_vector(self)
    (0..data.length - 1).each { |i|
      result.data[i] -= other.data[i]
    }

    result
  end

  def dot(other)
    product = 0
    (0..data.length - 1).each { |i|
      product += other.data[i] * data[i]
    }

    product
  end

  def norm
    res = 0
    data.each { |elem| res += elem ** 2 }

    Math.sqrt(res)
  end

  def clone_vector(other)
    result = Vector.new([])
    other.data.each { |elem| result.data << elem.clone }

    result
  end

  def to_s()
    "(" + data.join(', ') + ")"
  end

  # def data
  #   @data
  # end
end

a = Vector.new([1, 2, 3])
b = Vector.new([3, 4, 5])
c = Vector.new([5, 6, 7, 8])

p a.add(b).data
p a.subtract(b).data
p a.dot(b)
p a.norm
p a.to_s
