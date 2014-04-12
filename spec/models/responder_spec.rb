require 'spec_helper'

describe Responder do
  it{ should validate_presence_of :email }
  it{ should validate_presence_of :name  }

  context "populate private key" do
    subject{ FactoryGirl.create(:responder) }
    specify{ subject.private_key.should_not be_blank }
  end
end
