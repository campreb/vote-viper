class Admin::RespondersController < Admin::BaseController
  before_filter :current_campaign

  def index
    @responders = current_campaign.responders.paginate(page: params[:page])
  end

  def show
    @responder = current_responder
  end

  def new
    @responder = current_campaign.responders.new
  end

  def create
    @responder = current_campaign.responders.new(responder_params)
    if @responder.save
      redirect_to [:admin, current_campaign, :responders], notice: "Successfully added responder"
    else
      render :new
    end
  end

  def edit
    @responder = current_responder
  end

  def update
    @responder = current_responder
    if @responder.update_attributes(responder_params)
      redirect_to [:admin, current_campaign, @responder], notice: "Successfully updated responder"
    else
      render :edit
    end
  end

  private

  def current_responder
    current_campaign.responders.find(params[:id])
  end

  def current_campaign
    @campaign ||= Campaign.find(params[:campaign_id])
  end

  def responder_params
    params.require(:responder).permit(:name, :email)
  end
end
