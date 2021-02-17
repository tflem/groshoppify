module ApplicationHelper
  def title(*items)
    content_for :title do
      (items << 'Groshoppify').join(' - ')
    end
    return content_for :title unless items.empty?
  end
end
