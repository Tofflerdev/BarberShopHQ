#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:barbershop.db"

class Visit < ActiveRecord::Base
end

class Contact < ActiveRecord::Base
end

get '/' do
	erb "Hello!"			
end
get '/visit' do
	erb :visit
end

get '/contacts' do
	erb :contacts
end

post '/visit' do
	@username = params[:username]
	@phone = params[:phone]
	@date = params[:date]
	Visit.create(name: @username, phone: @phone, date: @date)
	erb "#{@username} we'll be waiting for you at #{@date}"
end

post '/contacts' do
	Contact.create(name: params[:username], message: params[:message])
	erb "Your message was sent. We will contact you soon"
end