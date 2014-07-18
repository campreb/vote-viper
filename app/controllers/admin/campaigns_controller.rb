class Admin::CampaignsController < Admin::BaseController
  def index
    @campaigns = Campaign.all
  end

  def show
    @campaign = current_campaign
  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.new campaign_params
    if @campaign.save
      redirect_to [:admin, @campaign], notice: "Successfully created campaign"
    else
      render :new
    end
  end

  def edit
    @campaign = current_campaign
  end

  def update
    @campaign = current_campaign
    if @campaign.update_attributes(campaign_params)
      redirect_to [:admin, @campaign], notice: "Successfully updated campaign"
    else
      render :edit
    end
  end


  private

  def current_campaign
    Campaign.find(params[:id])
  end

  def campaign_params
    params.require(:campaign).permit(
      :title, :description, :opens_at, :closes_at,
      questions_attributes:[
        :id, :title, :description, :sort_order, :_destroy,
        options_attributes:[:id, :name, :_destroy]
      ])
  end

end
