require 'spec_helper'

describe Admin::ElectionsController do
  let!(:user){ FactoryGirl.create(:user) }
  let!(:election){ FactoryGirl.create(:election) }
  let(:election_params){ FactoryGirl.attributes_for(:election) }

  before{ sign_in user }

  describe '#index' do
    before{ get :index }
    it{ should respond_with :success }
    specify{ assigns(:elections).should include(election) }
  end

  describe '#show' do
    before{ get :show, id: election.id }
    it{ should respond_with :success }
    specify{ assigns(:election).should eq(election)}
  end

  describe '#new' do
    before{ get :new }
    it{ should respond_with :success }
  end

  describe '#create' do
    let(:request){ post :create, election: election_params }
    it{ expect(request).to redirect_to admin_election_path(assigns(:election)) }
    it{ expect{request}.to change(Election, :count).by(1)  }
  end

  describe '#edit' do
    before{ get :edit, id: election.id }
    it{ should respond_with :success }
    specify{ assigns(:election).should eq(election)}
  end

  describe '#update' do
    let(:request){ patch :update, id: election.id, election: election_params }
    it{ expect(request).to redirect_to admin_election_path(assigns(:election)) }
    it{ expect{request}.to change{election.reload.attributes} }
  end

end
