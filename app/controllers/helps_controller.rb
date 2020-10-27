class HelpsController < ApplicationController

  def new 
    @help = Help.new(user:current_user)
  end

  def create   
    @help = Help.new(help_params.merge(user_id: session[:user_id]))
    if @help.request_type == 'material-need'
      @help.color = "red"
    else
      @help.color = "blue"
    end
    unless @help.save
      render json: @help.errors, status: :unprocessable_entity
    end
    respond_to do |format|
      if @help.save
        format.html { redirect_to @help, notice: 'Help was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @help.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @helps = Help.all
    render json: @helps
  end

  def show
    @help ||= Help.find(params[:id])
    render json: @help, :include => {
      :user => {

      },
    }
  end

  private

  def help_params
    params.require(:help).permit(
      :title,
      :description,
      :request_type,
      :location_long,
      :location_lat,
      :status
    )
  end

end