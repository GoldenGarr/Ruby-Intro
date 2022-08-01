=begin

Снова вернемся к задаче с хешом, которую мы делали, когда строковые и символьные ключи доступны по одинаковым ключам.
Решить только надо теперь с использованием модуля, который будет дополнять текущий хеш дополнительным функционалом

=end

module IndifferentAccessible
  def [](key)
    if self.key?(key.to_s)
      super(key.is_a?(Symbol) ? key.to_s : key)
    elsif self.key?(key.to_s.to_sym)
      super(key.is_a?(String) ? key.to_sym : key)
    else
      super(key)
    end
  end
end

class Hash
  def make_indifferent_accessible!
    self.singleton_class.include IndifferentAccessible
    self
  end
end

hash1 = { a: 1, 'b' => 2, 1 => 3 }.make_indifferent_accessible! # можно вызвать метод так

puts hash1['a'] #=> 1
puts hash1[:b] #=> 2
puts hash1[1] #=> 3

hash2 = { d: 3, true => 'True' }
puts hash2.make_indifferent_accessible!['d'] # можно и так, сразу обращаться по ключу => 3
puts hash2[true] #=> True

