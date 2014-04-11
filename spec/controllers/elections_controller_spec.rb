require 'spec_helper'

describe ElectionsController do
  render_views

  let!(:election){ FactoryGirl.create(:election) }

  describe "#index" do
    before{ get 'index' }
    it{ should respond_with :success }
    specify{ assigns(:elections).should include(election)}
  end

  describe '#show' do
    before{ get :show, id: election.id }
    it{ should respond_with :success }
    specify{ assigns(:election).should eq(election)}
  end
end
