=begin
В ruby есть safe navigation operator (&.), который позволяет избежать ошибки NoMethodError для nil-объекта:
some_object&.even? (some_object = 1 => true; some_object = nil => nil). Данный оператор удобен, когда есть вероятность, что объект будет nil,
но дополнительно проверять это будет затратно и неудобно. Тем не менее, этот оператор не исключает ошибок в ситуации,
когда метод не существует для объектов другого класса: false&.even? (NoMethodError).

Целью данной задачи является реализация такого метода, который будет возвращать nil, если для объекта нельзя вызвать указанный метод.
Метод должен находиться в модуле и получать параметром блок.

=end

module Tryable
  def try(&block)
    yield self
  rescue NoMethodError => error
    return nil
  end
end

class Object
  include Tryable
end

p false.try { even? } # nil
p false.try(&:even?) # nil
p 2.try(&:even?) # true
p 1.try { |obj| obj + 1 } # 2
p true.try { |obj| obj + 1 } # nil
p 1.try { |obj| obj + '' } # it still should raise error “String can't be coerced into Integer”

