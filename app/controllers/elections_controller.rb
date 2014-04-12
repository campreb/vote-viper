class ElectionsController < ApplicationController
  def show
    @responder = current_responder
    @election = @responder.election
    @votes = @election.questions.map{|q| @responder.votes.where(question_id: q.id).first_or_initialize}
  end
end
