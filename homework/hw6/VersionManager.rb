# Нужно реализовать класс VersionManager. Конструктор опционально должен принимать строку - версию.
# Допустимые варианты строки: “{major}” (“1”), “{major}.{minor}” (“1.1”), “{major}.{minor}.{patch}” (“1.1.1”).
# В варианте типа "1.1.1.1.1" оставить только первые три значения версии.
# Если часть версии - не целое число (напр. "а.4.е"), то генерировать ошибку.
# Если версия не указана, то значение по умолчанию - “0.0.1”.

# Тестовые варианты

# vm = VersionManager.new

# vm.major! # увеличивает мажорную версию, устанавливая минорную и патч в 0 (напр. “2.0.0”)
# vm.minor! # увеличивает минорную версию, устанавливая патч в 0 (напр. “2.1.0”)
# vm.patch! # увеличивает патч версию (напр. “2.1.1”)

# vm.rollback! # возвращается к прошлой версии, если это возможно, иначе выдать ошибку
# vm.release # возвращает текущую версию в формате “{major}.{minor}.{patch}”

class VersionManager
  public attr_accessor :major, :minor, :patch, :history

  def initialize(version = "0.0.1")
    parsed = version.split(".")

    if is_integer(parsed)
      @major = parsed.length > 0 ? parsed[0].to_i : 0
      @minor = parsed.length > 1 ? parsed[1].to_i : 0
      @patch = parsed.length > 2 ? parsed[2].to_i : 0
      @history = []
    end

    is_valid
  end

  def is_valid
    if @major < 0 ||
      @minor < 0 || @patch < 0
      raise 'Invalid version'
    end
  end

  def release
    [major, minor, patch].join(".")
  end

  def is_integer(parsed)
    result = true
    parsed.each do |version|
      result &&= (version.to_i.to_s == version.to_s) || version == ""
    end
    result
  end

  def major!
    save
    @major += 1
    @minor = @patch = 0
  end

  def minor!
    save
    @minor += 1
    @patch = 0
  end

  def patch!
    save
    @patch += 1
  end

  def rollback!
    curr = history.pop
    if curr.nil?
      raise 'Can not rollback to previous version'
    end

    @major = curr[0]
    @minor = curr[1]
    @patch = curr[2]
  end

  def save
    @history << [major, minor, patch]
  end
end

# manager = VersionManager.new("1.1.1")
# manager = VersionManager.new("a.1.1")
# manager = VersionManager.new("1.-2.1")
# manager = VersionManager.new
manager = VersionManager.new(".1.1")
p manager.release # => 0.1.1

manager.patch!
p manager.release # => 0.1.2

manager.minor!
p manager.release # => 0.2.0

manager.major!
p manager.release # => 1.0.0

manager.rollback!
p manager.release # => 0.2.0

manager.rollback!
p manager.release # => 0.1.2

manager.rollback!
p manager.release # => 0.1.1

manager.rollback!
p manager.release # => Error