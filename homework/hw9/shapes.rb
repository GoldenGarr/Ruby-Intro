=begin

Требуется сортировать фигуры по их площади.
Из фигур есть: Square (площадь - “квадрат” сторон), Rectangle (площадь - ширина * длина), Triangle (основание * высоту / 2), Круг (pi * (R^2)),
и произвольная CustomShape (площадь просто задается).

=end

class ComparableFigure
  include Comparable

  def <=>(other)
    space <=> other.space
  end

  def space
    0
  end
end

class Square < ComparableFigure
  private attr_accessor :length

  def initialize(length)
    @length = length
  end

  def space
    length ** 2
  end
end

class Rectangle < ComparableFigure
  private attr_accessor :length, :width

  def initialize(length, width)
    @length = length
    @width = width
  end

  def space
    length * width
  end
end

class Triangle < ComparableFigure
  private attr_accessor :height, :side

  def initialize(height, side)
    @height = height
    @side = side
  end

  def space
    0.5 * height * side
  end
end

class Circle < ComparableFigure
  private attr_accessor :radius

  def initialize(radius)
    @radius = radius
  end

  def space
    Math::PI * radius ** 2
  end
end

class CustomShape < ComparableFigure
  private attr_accessor :space

  def initialize(space)
    @space = space
  end

  def space
    @space
  end
end

shapes = [Square.new(4), Rectangle.new(2, 5),
          Triangle.new(10, 2), Circle.new(2), CustomShape.new(0)]
# shapes = [Square.new(1), Square.new(19), Square.new(0), Rectangle.new(1, 1)]

p shapes.sort

