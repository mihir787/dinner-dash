class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def add_item(item_id)
    contents[item_id.to_s] ||= 0
    contents[item_id.to_s] += 1
  end

  def count_of(item_id)
    contents[item_id.to_s]
  end

  def count_all
    contents.values.sum
  end

  def quantity(item_id)
    contents[item_id]
  end

  def increase_quantity(item_id)
    contents[item_id] += 1
  end

  def decrease_quantity(item_id)
    contents[item_id] -= 1 if contents[item_id] > 0
  end

  def find_items
    contents.keys.map { |item_id| Item.find(item_id)}
  end

  def find_valid_items
    items = subtotal.reject { |_id, total| total == 0}
    items.keys.map { |item_id| Item.find(item_id)}
  end

  def subtotal
    find_items.each_with_object({}) do |item, hash|
      hash[item.id] = quantity(item.id.to_s) * item.price
    end
  end

  def total
    subtotal.values.sum
  end

  def remove_item(item_id)
    contents.delete(item_id)
  end

  def create_order_items(order_id)
    contents.find_items.each do
      OrderItems.new()
    end
  end

  def clear
    contents.clear
  end
end
