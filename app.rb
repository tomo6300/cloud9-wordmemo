require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require 'open-uri'
require 'sinatra/json'
require './image_uploader.rb'
require './models/contribution.rb'

get '/' do
    @contents = Contribution.order('id desc').all
    erb :index
end

post '/new' do
    Contribution.create({
       
        title: params[:title],
        body: params[:body],
        linkTitle: params[:linkTitle],
        url: params[:url],
        img:  "",
        good: 0
    })
    
    if params[:file]
        image_upload(params[:file])
    end
    
    redirect '/'
end

post '/delete/:id' do
    Contribution.find(params[:id]).destroy
    redirect '/'
end    

post '/edit/:id' do
    @content = Contribution.find(params[:id])
    erb :edit
end

post '/renew/:id' do
    @content = Contribution.find(params[:id])
    @content.update({
        name: params[:user_name],
        body: params[:body],
        title: params[:title],
        linkTitle: params[:linkTitle],
        url: params[:url]
    })
    redirect '/'
end

post '/good/:id' do
    @content = Contribution.find(params[:id])
    good = @content.good
    @content.update({
        good: good + 1
    })
    redirect '/'
end    