class ResponderMailer < ActionMailer::Base
  default from: "from@example.com"

  def campaign_notification(responder)
    @responder = responder
    @campaign  = responder.campaign
    mail( to: responder.email,
          subject: "Invitation to participate in #{@campaign.title}" )
  end
end
