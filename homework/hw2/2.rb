=begin

Считать "#" символом для удаления прошлого символа. Это значит, что строка "a#bc#d" преобразуется к виду "bd".
  Необходимо написать метод для обработки строки с "#" символами.


  Тестовые варианты:
             "abc#d##c"      ==>  "ac"
"abc##d######"  ==>  ""
"#######"       ==>  ""
""              ==>  ""

=end

def f(string)
  result = ""
  string.split("").each { |character|
    if result != "" && character == "#"
      result.chop!
    end

    if character != "#"
      result << character
    end
  }
  result
end


puts f("abc#d##c")
puts f("abc##d######")
puts f("#######")
puts f("")
