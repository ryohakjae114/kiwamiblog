module ApplicationHelper
  def title(title_text)
    content_tag :div, title_text, class: 'fs-3 my-4'
  end
end
