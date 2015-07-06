module ApplicationHelper

  def urls_to_images(s)
    s.gsub! /\s(http:\/\/.*?\.(png|jpg))\s/,
    '<p><img src="\1"/></p>'
    s.html_safe
  end

  def urls_to_links(s)
    s.gsub! /\s(https:\/\/.*?)\s/,
      '<a href="\1">\1</a>'
    s.html_safe
  end

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end
end
