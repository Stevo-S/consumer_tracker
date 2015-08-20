class MessagesController < ApplicationController

  protect_from_forgery except: :create


  def create
    @message = IncomingMessage.new(sender: params[:sender], message: params[:message])

    number = @message.message.split.first
    
    product = Product.find_by_tag( number )
    if product.nil?
	response = 'Sorry that number does not exist'
    elsif product.confirmed
    	response = 'Product already confirmed'
    else
	response = 'Product Details:' + product.name  + ' from ' + product.manufacturer
	product.confirmed = true
	product.save
    end


    if @message.save
	render text: 'SUCCESS: Message from #{@message.sender} saved'
    else
    	render text: 'ERROR: Message from #{#message.sender} could NOT be saved!'
    end

    RestClient.get '192.168.0.191:13013/cgi-bin/sendsms', {params: {username: 'sms-app', password: 'app125', to: @message.sender, text: response} }
  end
end
