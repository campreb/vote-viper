require 'spec_helper'

describe Admin::CampaignsController do
  let!(:user){ FactoryGirl.create(:user) }
  let!(:campaign){ FactoryGirl.create(:campaign) }
  let(:campaign_params){ FactoryGirl.attributes_for(:campaign) }

  before{ sign_in user }

  describe '#index' do
    before{ get :index }
    it{ should respond_with :success }
    specify{ assigns(:campaigns).should include(campaign) }
  end

  describe '#show' do
    before{ get :show, id: campaign.id }
    it{ should respond_with :success }
    specify{ assigns(:campaign).should eq(campaign)}
  end

  describe '#new' do
    before{ get :new }
    it{ should respond_with :success }
  end

  describe '#create' do
    let(:request){ post :create, campaign: campaign_params }
    it{ expect(request).to redirect_to admin_campaign_path(assigns(:campaign)) }
    it{ expect{request}.to change(Campaign, :count).by(1)  }
  end

  describe '#edit' do
    before{ get :edit, id: campaign.id }
    it{ should respond_with :success }
    specify{ assigns(:campaign).should eq(campaign)}
  end

  describe '#update' do
    let(:request){ patch :update, id: campaign.id, campaign: campaign_params }
    it{ expect(request).to redirect_to admin_campaign_path(assigns(:campaign)) }
    it{ expect{request}.to change{campaign.reload.attributes} }
  end

  describe '#notify_responders' do
    let!(:responders){ FactoryGirl.create_list(:responder, 5, campaign: campaign ) }
    let(:request){ post :notify_responders, id: campaign.id }
    it{ expect(request).to redirect_to admin_campaign_path(campaign) }
    it{ expect{request}.to change(ActionMailer::Base.deliveries, :length).by(5) }
  end
end
