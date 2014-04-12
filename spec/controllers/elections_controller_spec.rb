require 'spec_helper'

describe ElectionsController do
  render_views
  let!(:responder){ FactoryGirl.create(:responder) }

  describe '#show' do
    before{ get :show, key: responder.private_key }
    it{ should respond_with :success }
    specify{ assigns(:responder).should eq(responder)         }
    specify{ assigns(:election).should eq(responder.election) }
  end
end
