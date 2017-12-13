require 'sinatra/base'
require 'Capybara/dsl'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }


    get '/' do
      erb :super_hero
    end

    post '/team' do
      @team = Team.new(params)

      params[:team][:member].each do |member|
        Superhero.new(member)
      end
      @members = Superhero.all

      erb :team
    end


end
