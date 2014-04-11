class ElectionsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @elections = Election.all
  end

  def show
    @election = Election.find(params[:id])
  end
end
