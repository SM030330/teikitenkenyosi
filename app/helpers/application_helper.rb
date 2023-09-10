module ApplicationHelper

  def item_doing?(item)
    if item.doing == true
      "作業済み"
    else
      "作業前"
    end
  end

  def item_doing_return_css_class(item)
    if item.doing == true
      "calendar_item_doing"
    else
      "calendar_item_undoing"
    end
  end
end
