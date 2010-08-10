module ApplicationHelper


  def menu_item_link(*args, &block)
    content_tag :li, :class => "first_level" do
      link_to(*args) + 
      ( content_tag :ul, :class => "sub_items", &block if block_given? ).to_s
    end
  end
end
