=begin
Создать модуль с набором полезных методов для строк.
Например, чтобы модуль содержал метод capitalize_each_word:
=end

module StringUtility
  def capitalize_each_word
    self.split.map(&:capitalize).join(' ')
  end

  # Remove space, newline and tab
  def complete_strip
    self.gsub(/\s+/, "")
  end

  def complete_strip_capitalize
    capitalize_each_word.complete_strip
  end
end

str1 = 'string one'
str2 = 'string two'

=begin
str1.extend StringUtility

p str1.capitalize_each_word # => "String One"
p str2.capitalize_each_word # => NoMethodError
=end

class String
  include StringUtility
end

bulky_string = "   \nmy name is\t Jef\n Schlagg   "
p bulky_string.complete_strip_capitalize
