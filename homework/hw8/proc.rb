=begin
Реализовать метод, который принимает один параметр с числом, а возвращает объект proc,
 который можно использовать для добавления переданного числа к другим числовым значениям.

Тестовые варианты

=end

def add_num(num)
  proc {|elem| elem + num}
end


add_num_1 = add_num(1) # proc

p add_num_1.call(3) # 4
p add_num_1.call(5.7) # 6.7

add_num_m10 = add_num(-10)

p add_num_m10.call(44) # 34
p add_num_m10.call(-20) # -30
