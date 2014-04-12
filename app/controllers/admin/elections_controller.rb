class Admin::ElectionsController < Admin::BaseController
  def index
    @elections = Election.all
  end

  def show
    @election = current_election
  end

  def new
    @election = Election.new
  end

  def create
    @election = Election.new election_params
    if @election.save
      redirect_to [:admin, @election], notice: "Successfully created election"
    else
      render :new
    end
  end

  def edit
    @election = current_election
  end

  def update
    @election = current_election
    if @election.update_attributes(election_params)
      redirect_to [:admin, @election], notice: "Successfully updated election"
    else
      render :edit
    end
  end


  private

  def current_election
    Election.find(params[:id])
  end

  def election_params
    params.require(:election).permit(
      :title, :description,
      questions_attributes:[
        :id, :title, :description, :sort_order, :_destroy,
        options_attributes:[:id, :name, :_destroy]
      ])
  end

end
