class IncomingMessagesController < ApplicationController
  before_action :set_incoming_message, only: [:show, :edit, :update, :destroy]

  # GET /incoming_messages
  # GET /incoming_messages.json
  def index
    @incoming_messages = IncomingMessage.all.order(created_at: :desc)
  end

  # GET /incoming_messages/1
  # GET /incoming_messages/1.json
  def show
  end

  # GET /incoming_messages/new
  def new
    @incoming_message = IncomingMessage.new
  end

  # GET /incoming_messages/1/edit
  def edit
  end

  # POST /incoming_messages
  # POST /incoming_messages.json
  def create
    @incoming_message = IncomingMessage.new(incoming_message_params)

    respond_to do |format|
      if @incoming_message.save
        format.html { redirect_to @incoming_message, notice: 'Incoming message was successfully created.' }
        format.json { render action: 'show', status: :created, location: @incoming_message }
      else
        format.html { render action: 'new' }
        format.json { render json: @incoming_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /incoming_messages/1
  # PATCH/PUT /incoming_messages/1.json
  def update
    respond_to do |format|
      if @incoming_message.update(incoming_message_params)
        format.html { redirect_to @incoming_message, notice: 'Incoming message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @incoming_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incoming_messages/1
  # DELETE /incoming_messages/1.json
  def destroy
    @incoming_message.destroy
    respond_to do |format|
      format.html { redirect_to incoming_messages_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_incoming_message
      @incoming_message = IncomingMessage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def incoming_message_params
      params.require(:incoming_message).permit(:sender, :message)
    end
end
