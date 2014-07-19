require "spec_helper"

describe ResponderMailer do
  let(:campaign){ FactoryGirl.build_stubbed(:campaign) }
  let(:responder){ FactoryGirl.build_stubbed(:responder, campaign: campaign) }
  describe "#campaign_notification" do
    subject{ ResponderMailer.campaign_notification(responder) }
    it{ expect(subject.subject).to eq("Invitation to participate in #{campaign.title}")}
    it{ expect(subject.body.encoded).to include("Hi #{responder.name}")}
  end
end
