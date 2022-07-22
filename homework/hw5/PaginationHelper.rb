=begin
Нужно реализовать класс PaginationHelper,
 который позволит пагинировать массив.
 Класс получает в конструктор сам массив и
 число элементов для дробления массива.
=end

class PaginationHelper

  def initialize(data, page_size)
    @data = data
    @page_size = page_size
    @page_manager = (0..data.size).step(page_size).to_a
  end

  def page_count
    page_manager.size
  end

  def item_count
    data.size
  end

  def page_item_count(index)
    if index < 0 || index >= page_count
      -1
    else
      index == page_count - 1 ? item_count - page_manager[index] : page_size
    end
  end

  def page_index(index)
    index < 0 || index >= item_count ? -1 : index / page_size
  end

  private attr_reader :data, :page_size, :page_manager
end

helper = PaginationHelper.new(%w[a b c d e f], 4)

p helper.page_count # 2
p helper.item_count # 6
p helper.page_item_count(0) # 4, т.к нумерация страниц с 0
p helper.page_item_count(1) # 2, последняя страница содержит 2 элемента
p helper.page_item_count(2) # -1

# page_index принимает индекс элемента и возвращает страницу, на которой этот элемент находится
p helper.page_index(5) # 1
p helper.page_index(2) # 0
p helper.page_index(20) # -1
p helper.page_index(-10) # -1
