require 'spec_helper'

describe Admin::RespondersController do
  render_views

  let!(:user){ FactoryGirl.create(:user) }
  let!(:election){ FactoryGirl.create(:election) }
  let!(:responder){ FactoryGirl.create(:responder, election: election)}
  let(:responder_attrs){ FactoryGirl.attributes_for(:responder) }

  before{ sign_in user }

  describe '#index' do
    before{ get :index, election_id: election.id }
    it{ should respond_with(:success) }
    specify{ assigns(:election).should eq(election) }
    specify{ assigns(:responders).should include(responder)}
  end

  describe '#show' do
    before{ get :show, election_id: election.id, id: responder.id }
    it{ should respond_with(:success) }
    specify{ assigns(:election).should eq(election) }
    specify{ assigns(:responder).should eq(responder) }
  end

  describe '#new' do
    before{ get :new, election_id: election.id }
    it{ should respond_with(:success) }
    specify{ assigns(:election).should eq(election) }
  end

  describe '#create' do
    let(:request){ post :create, election_id: election.id, responder: responder_attrs }
    it{ expect(request).to redirect_to admin_election_responders_path(election)}
    it{ expect{request}.to change(election.responders, :count).by(1) }
  end

  describe '#edit' do
    before{ get :edit, election_id: election.id, id: responder.id }
    it{ should respond_with(:success) }
    specify{ assigns(:election).should eq(election) }
    specify{ assigns(:responder).should eq(responder)}
  end

  describe '#update' do
    before{ patch :update, election_id: election.id, id: responder.id, responder: responder_attrs }
    it{ expect(request).to redirect_to admin_election_responder_path(election, responder)}
    # it{ expect{request}.to change{ responder.reload.attributes } }

  end

end
