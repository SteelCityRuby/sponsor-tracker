module ApplicationHelper
  def page_header title
    provide :title, title
    content_tag :h1, title, class: "page-header"
  end
end
