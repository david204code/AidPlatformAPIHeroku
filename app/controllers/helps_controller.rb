class HelpsController < ApplicationController

  def new 
    @help = Help.new(user:current_user)
  end

  def create   
    # @help = Help.new(help_params.merge(user_id: session[:user_id]))
    @help = Help.new(help_params)
    if @help.request_type == 'material-need'
      @help.color = "red"
    else
      @help.color = "blue"
    end
    unless @help.save
      render json: @help.errors, status: :unprocessable_entity
    end
    # respond_to do |format|
    #   if @help.save
    #     format.html { redirect_to @help, notice: 'Help was successfully created.' }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @help.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def index
    @helps = Help.all
    render json: @helps.to_json( :methods => [:accepted_helps])
  end

  def publish
    now = Time.now
    @helps = Help.left_outer_joins(:accepted_helps).group('helps.id').having('count(help_id) < 5') & Help.where(status: 'active') & Help.where(created_at: (now - 24.hours)..now)
    render json: @helps
  end

  # current dashboard display
  def activeHelp
    @helps = Help.where(user_id: params[:id], status: ['active', 'ongoing'])
    render json: @helps, :include => {
      :user => {
        
      },
      :accepted_helps => {
        :include => {
          :user => {
            
          }
        }
      },
      :conversations => {

      },
      :messages => {

      },
    }
  end

  
  def helpChat
    # @helps = Help.find_by user_id: current_user
    @helps = Help.where(user_id: current_user) && Help.find(params[:id])
    render json: @helps, :include => {
      :user => {
      },
      :accepted_helps => {
        :only => [:id, :user_id],
        :include => {
          :user => {
            :only => [:id, :email,]
          }
        }
      },
      :conversations => {
      },
      :messages => {
      },
    }
  end

  def counter
    now = Time.now
    @helps = (Help.where(status: 'active') & Help.where(created_at: (now - 24.hours)..now)).count
    render json: @helps
  end

  def show
    @help ||= Help.find(params[:id])
    render json: @help, :include => {
      :user => {

      },
      :accepted_helps => {
        :include => {
          :user => {

          },
        },
      },
    }
  end

  # For same user cannot accepted same help twice
  def checkUser
    @help = AcceptedHelp.where(help_id: params[:helpId]).where(user_id: params[:id])
    render json: @help, :include => {
      :user => {

      },
    }
  end

  def updateStatus
    @help = Help.find_by(id: params[:id])
    @help.status = 'ongoing'
    @help.save
  end

  def completeHelp
    @help = Help.find_by(id: params[:id])
    @help.status = 'completed'
    @help.save
  end

  def archiveHelp
    @help = Help.find_by(id: params[:id])
    @help.status = 'incomplete'
    @help.save
  end

  private

  def help_params
    params.require(:help).permit(
      :title,
      :description,
      :request_type,
      :location_long,
      :location_lat,
      :status,
      :user_id
    )
  end

end