# frozen_string_literal: true

module ApplicationHelper
  def title(*items)
    content_for :title do
      (items << 'Groshoppify').join(' - ')
    end
    return content_for :title unless items.empty?
  end

  def admins_only(&block)
  	block.call if current_user.try(:admin?)
  end
end
