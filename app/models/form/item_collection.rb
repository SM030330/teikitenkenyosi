class Form::ItemCollection < Form::Base
  attr_accessor :items, :items_container 

  def initialize(attributes = {})
    super attributes
    form_count = attributes.to_h.count
    self.items = form_count.times.map { Item.new() } unless self.items.present?
  end

  def items_attributes=(attributes)
    item_ids = attributes.map { |n,i| i["id"] }
    self.items = Item.where(id: item_ids).order( do_day: :asc)
    self.items_container = attributes
  end

  # def build
  #   items_map = items.map(&:name)
                  
  #   self.items
  # end

  def update
    self.items.each_with_index do |item, i|
      item.update!(self.items_container[i.to_s])
    end
    true
  end
end
