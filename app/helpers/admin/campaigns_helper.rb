module Admin::CampaignsHelper
  def campaign_sidebar
    content_tag :div, class: 'row' do
      content = content_tag( :div, class: "col-sm-2" )do
        render 'admin/campaigns/sidebar'
      end
      content << content_tag( :div, class: "col-sm-10" )do
        yield
      end
      content.html_safe
    end
  end
end
