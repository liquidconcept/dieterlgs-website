# encoding: utf-8
require 'pony'
require 'sinatra'
require 'sinatra/base'
require 'sinatra/activerecord'
require './app/models/date'

require File.expand_path('../../config/application', __FILE__)
require File.expand_path('../../config/nanoc', __FILE__)
require File.expand_path('../../config/compass', __FILE__)

include Nanoc::Helpers::Sprockets

configure do
  @@config = YAML.load_file('./config/settings.yaml') rescue {}
end

set :database, "sqlite3:///db/database.sqlite3"

module Application
  class Website < Sinatra::Base
    set :static, true
    set :public_folder, File.expand_path('../../public', __FILE__)

    # Contact form
    post '/send_contact_1' do
      template = ERB.new(File.read(File.expand_path('../templates/contact.text.erb', __FILE__), :encoding => 'UTF-8'))

      Pony.mail(
        :from     => params[:message_request][:mail],
        :to       => COMMAND_EMAIL_TO,
        :charset  => 'utf-8',
        :subject  => COMMAND_SUBJECT,
        :body     => template.result(binding)
      )
      redirect "/"
    end

    # Contact form
    post '/send_contact_2' do
      template = ERB.new(File.read(File.expand_path('../templates/contact2.text.erb', __FILE__), :encoding => 'UTF-8'))

      Pony.mail(
        :from     => params[:message_request][:mail],
        :to       => COMMAND_EMAIL_TO,
        :charset  => 'utf-8',
        :subject  => COMMAND_SUBJECT,
        :body     => template.result(binding)
      )
      redirect "/"
    end
  end

  class Admin < Sinatra::Base
    use Rack::MethodOverride

    use Rack::Auth::Basic, "Protected Area" do |username, password|
      username == @@config['basic_auth']['username'] && password == @@config['basic_auth']['password']
    end

    get '/' do
      erb :"admin/index"
    end
  end
end
