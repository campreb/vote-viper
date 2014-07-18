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
end
