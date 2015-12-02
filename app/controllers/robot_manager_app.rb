require 'models/robot_manager'

class RobotManagerApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)

  get '/' do
    erb :dashboard
  end

  # read
  get '/robots' do
    @robots = RobotManager.all
    erb :index
  end

  # create
  get '/robots/new' do
    erb :new
  end

  # create
  post '/robots' do
    RobotManager.create(params[:robot])
    redirect '/robots'
  end

  # read
  get '/robots/:id' do |id|
    @robot = RobotManager.find(id.to_i)
    erb :show
  end

  not_found do
    erb :error
  end
end
