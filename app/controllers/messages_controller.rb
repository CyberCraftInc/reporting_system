class MessagesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
    @search = Message.search(params[:q])
    @messages = @search.result(distinct: true)
    
    #@messages = Message.search(params[:search])
    
    @messages =  Message.all.select { |m| m.category == "Public" } if current_user.guest?
    
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @message.user_id = current_user.id

    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    puts "MESSAGE IS: #@message"
  
    if @message.destroy
      flash[:success] = 'Project was destroyed!'
     else
      flash[:warning] = 'Cannot destroy this message...'
    end
  redirect_to messages_path
  end

  private
    def message_params
      params.require(:message).permit(:body, :category, :user_id, messagetype_ids:[])
    end
end
