require 'spec_helper'

describe Election do
  it{ should validate_presence_of :name }
end
