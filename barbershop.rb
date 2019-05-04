require 'sinatra'

get '/' do
	erb :index
end

post '/' do
	@user_name = params[:user_name]
	@phone = params[:phone]
	@date_time = params[:date_time]
	@master = params[:master]
	
	@title = 'Thanks'
	@message = "Dear #{@user_name}, we'll be waiting for you at #{@date_time} to Master: #{@master}"
	
	f = File.open 'users.txt', 'a'
	f.write "User: #{@user_name}, Phone: #{@phone}, Date and Time: #{@date_time}, Master: #{@master}\n"
	f.close

	erb :message
end

get '/admin' do

	@message = ""
	
	f = File.open 'users.txt', 'r'
	while (line = f.gets)
		@message += line 
	end
	f.close

	@title = 'Gast list'

	erb :message
end


