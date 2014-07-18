class CampaignsController < ApplicationController
  def show
    @responder = current_responder
    @campaign = @responder.campaign
    @responses = @campaign.questions.map{|q| @responder.responses.where(question_id: q.id).first_or_initialize}
  end


  private

  def current_responder
    key = params[:key] || session[:responder_key]
    session[:responder_key] = key
    Responder.where(private_key: key).first if key.present?
  end

end
