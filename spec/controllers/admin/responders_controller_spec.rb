require 'spec_helper'
include ActionDispatch::TestProcess

describe Admin::RespondersController do
  render_views

  let!(:user){ FactoryGirl.create(:user) }
  let!(:campaign){ FactoryGirl.create(:campaign) }
  let!(:responder){ FactoryGirl.create(:responder, campaign: campaign)}
  let(:responder_attrs){ FactoryGirl.attributes_for(:responder) }

  before{ sign_in user }

  describe '#index' do
    before{ get :index, campaign_id: campaign.id }
    it{ should respond_with(:success) }
    specify{ assigns(:campaign).should eq(campaign) }
    specify{ assigns(:responders).should include(responder)}
  end

  describe '#show' do
    before{ get :show, campaign_id: campaign.id, id: responder.id }
    it{ should respond_with(:success) }
    specify{ assigns(:campaign).should eq(campaign) }
    specify{ assigns(:responder).should eq(responder) }
  end

  describe '#new' do
    before{ get :new, campaign_id: campaign.id }
    it{ should respond_with(:success) }
    specify{ assigns(:campaign).should eq(campaign) }
  end

  describe '#create' do
    let(:request){ post :create, campaign_id: campaign.id, responder: responder_attrs }
    it{ expect(request).to redirect_to admin_campaign_responders_path(campaign)}
    it{ expect{request}.to change(campaign.responders, :count).by(1) }
  end

  describe '#edit' do
    before{ get :edit, campaign_id: campaign.id, id: responder.id }
    it{ should respond_with(:success) }
    specify{ assigns(:campaign).should eq(campaign) }
    specify{ assigns(:responder).should eq(responder)}
  end

  describe '#import' do
    let(:request) do
      import_file = fixture_file_upload('responders_import_file.csv', 'text/csv')
      post :import, responders_import_file: import_file, campaign_id: campaign.id
    end

    it { expect(request).to redirect_to admin_campaign_responders_path(campaign) }
    it { request; expect(flash[:notice]).to eq "Successfully imported responders" }
    it { expect { request }.to change(campaign.responders, :count).by(3) }
  end

  describe '#send_notification' do
    let(:request){ post :send_notification, campaign_id: campaign.id, id: responder.id }

    it{ expect(request).to redirect_to admin_campaign_responder_path(campaign, responder) }
    it{ expect{request}.to change(ActionMailer::Base.deliveries, :length).by(1) }
    it{ request; expect(ActionMailer::Base.deliveries.last.to).to include(responder.email) }
  end

  describe '#update' do
    before{ patch :update, campaign_id: campaign.id, id: responder.id, responder: responder_attrs }
    it{ expect(request).to redirect_to admin_campaign_responder_path(campaign, responder)}
    # it{ expect{request}.to change{ responder.reload.attributes } }

  end

end
