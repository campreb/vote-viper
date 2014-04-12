module ApplicationHelper

  def fontawesome(style, text="")
    i = content_tag :i, '', class: "fa fa-#{style}"
    "#{i} #{text}".html_safe
  end
end
