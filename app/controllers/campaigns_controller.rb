class CampaignsController < ApplicationController
  def show
    @responder = current_responder
    @campaign = @responder.campaign
    @responses = responders_responses
  end

  def submit
    @responder = current_responder
    @campaign = @responder.campaign
    unless @responder.update_attributes(responder_params)
      render :show
    end
  end

  private

  def current_responder
    key = params[:key] || session[:responder_key]
    session[:responder_key] = key
    Responder.where(private_key: key).first if key.present?
  end

  def responders_responses
    @campaign.questions.map do |q|
      @responder.responses.where(question_id: q.id).first_or_initialize
    end
  end

  def responder_params
    params.require(:responder).permit(responses_attributes:[:option_id, :question_id])
  end
end
