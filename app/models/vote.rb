class Vote < ActiveRecord::Base
  belongs_to :responder
  belongs_to :question
  belongs_to :option
end
