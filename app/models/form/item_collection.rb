class Form::ItemCollection < Form::Base
  attr_accessor :items, :items_container

  def initialize(attributes = {})
    super attributes
  end

  def items_attributes=(attributes)
    item_ids = attributes.map { |n,i| i["id"] }
    self.items = Item.where(id: item_ids).order( do_day: :asc)
    self.items_container = attributes
  end

  def update_doing
    self.items.each_with_index do |item, i|
      item.update!(self.items_container[i.to_s])
    end
  end

  def destroy
    self.items.each_with_index do |item, i|
      Item.destroy(item.id) if self.items_container[i.to_s][:is_delete] == 1.to_s
    end
  end
end
