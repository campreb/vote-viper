require 'spec_helper'

describe CampaignsController do
  render_views
  let!(:responder){ FactoryGirl.create(:responder) }

  describe '#show' do
    before{ get :show, key: responder.private_key }
    it{ should respond_with :success }
    specify{ assigns(:responder).should eq(responder)         }
    specify{ assigns(:campaign).should eq(responder.campaign) }
  end

  describe '#submit' do
    before{ session[:responder_key] = responder.private_key }
    let(:question){ FactoryGirl.create(:question, campaign: responder.campaign) }
    let(:option){ FactoryGirl.create(:option, question: question)}
    let(:request){ post :submit, responder:{responses_attributes:[{question_id: question.id, option_id: option.id}]}}
    it{ expect(request).to render_template(:submit) }
    it{ expect{request}.to change(Response, :count) }
  end
end
