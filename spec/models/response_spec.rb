require 'spec_helper'

describe Response do
  it { should belong_to :question }
  it { should belong_to :option }
  it { should belong_to :responder }
end
