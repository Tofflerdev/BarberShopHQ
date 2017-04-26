#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:barbershop.db"

class Visit < ActiveRecord::Base
end

get '/' do
	erb "Hello!"			
end
get '/visit' do
	erb :visit
end

post '/visit' do
	@username = params[:username]
	@phone = params[:phone]
	@date = params[:date]
	Visit.create(username: @username, phone: @phone, date: @date)
	erb "#{@username} we'll be waiting for you at #{@date}"
end