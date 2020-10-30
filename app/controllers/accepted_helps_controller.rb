class AcceptedHelpsController < ApplicationController

  def new
    @accepted_help = AcceptedHelp.new(user:current_user)
  end

  def create
    # @accepted_help = AcceptedHelp.new(accepted_params.merge(user_id: session[:user_id]))
    @accepted_help = AcceptedHelp.new(accepted_params)
    
    unless @accepted_help.save
      render json: @accepted_help.errors, status: :unprocessable_entity
    end
  end

  def index
    @accepted_helps = AcceptedHelp.all
    render json: @accepted_helps.to_json( :methods => [:conversation])
  end

  def show
    # @accepted_helps ||= AcceptedHelp.find(params[:id])
    # render json: @accepted_helps
    @accepted_helps = AcceptedHelp.find_by(id: params[:id])
    render json: @accepted_helps, :include => {
      :help => {
        :include => {
          :user => {
                        
          }
        }
      },
      :user => {

      },
      :conversation => {
        
      }
    }
  end

  def activeAcceptedHelps
    @accepted_helps = AcceptedHelp.where(user_id: params[:id], active: [true])
    render json: @accepted_helps, :include => {
      :user => {

      },
      :help => {

      },
    }
  end

  # Change active to false
  def updateActive
    @accepted_help = AcceptedHelp.find_by(id: params[:id])
    @accepted_help.active = false
    @accepted_help.save
  end

  def getLast
    @accepted_help = AcceptedHelp.last
    render json: @accepted_help
  end

  def acceptedHelpCounter
    @accepted_help = AcceptedHelp.where(help_id: params[:id]).length
    render json: @accepted_help
  end

  private 

  def get_help
    @help ||= Help.find(params[:help_id])
  end

  def accepted_params
    params.require(:accepted_help).permit(:help_id, :user_id)
  end

end