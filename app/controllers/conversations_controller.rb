class ConversationsController < ApplicationController
  before_action :set_conversation, only: [:show, :edit, :update, :destroy]

  def index
    @conversations = Conversation.all
    render json: @conversations
  end

  def show
  end

  def findAccepted
    @conversation = Conversation.find_by(accepted_help_id: params[:id])
    render json: @conversation
  end

  def new
    @conversation = Conversation.new
  end

  def edit
  end

  def create 
    @conversation = Conversation.new(conversation_params)

    unless @conversation.save
      render json: @conversation.errors, status: :unprocessable_entity
    end

    if @conversation.save
      render json: @conversation
    else
      render json: @conversation.errors, status: :unprocessable_entity 
    end
  end

  def update
    respond_to do |format|
      if @conversation.update(conversation_params)
        format.html { redirect_to @conversation, notice: 'Conversation was successfully updated.' }
        format.json { render :show, status: :ok, location: @conversation }
      else
        format.html { render :edit }
        format.json { render json: @conversation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @conversation.destroy
    respond_to do |format|
      format.html { redirect_to conversations_url, notice: 'Conversation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_conversation
    @conversation = Conversation.find(params[:id])
  end

  def conversation_params
    params.require(:conversation).permit(:title, :accepted_help_id)
  end

end