module Admin::ElectionsHelper
  def election_sidebar
    content_tag :div, class: 'row' do
      content = content_tag( :div, class: "col-sm-2" )do
        render 'admin/elections/sidebar'
      end
      content << content_tag( :div, class: "col-sm-10" )do
        yield
      end
      content.html_safe
    end
  end
end
