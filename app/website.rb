# encoding: utf-8
require 'pony'
require 'sinatra'
require 'sinatra/base'
require 'sinatra/activerecord'
require './app/models/date'
require './app/models/text'
require './app/models/price'

require File.expand_path('../../config/application', __FILE__)
require File.expand_path('../../config/nanoc', __FILE__)
require File.expand_path('../../config/compass', __FILE__)

include Nanoc::Helpers::Sprockets

configure do
  @@config = YAML.load_file(File.expand_path('../../config/settings.yml', __FILE__)) rescue {}
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
        :to => @@config['mailer']['mail_to'],
        :cc => params[:message_request][:mail],
        :via => :smtp,
        :via_options => {
          :address              => 'smtp.gmail.com',
          :port                 => '587',
          :enable_starttls_auto => true,
          :user_name            => 'info@liquid-concept.ch',
          :password             => @@config['mailer']['password'],
          :authentication       => :plain,
          :domain               => "localhost.localdomain"
        },
        :charset  => 'utf-8',
        :subject  => @@config['mailer']['subject'],
        :body     => template.result(binding),
        :headers  => {
          'Reply-To' => params[:message_request][:mail],
          'From' => '"Liquid Concept Mailler" <no-reply@liquid-concept.ch>'
        }
      )
      redirect "/"
    end

    # Contact form
    post '/send_contact_2' do
      template = ERB.new(File.read(File.expand_path('../templates/contact2.text.erb', __FILE__), :encoding => 'UTF-8'))

      Pony.mail(
        :to => @@config['mailer']['mail_to'],
        :cc => params[:message_request][:mail],
        :via => :smtp,
        :via_options => {
          :address              => 'smtp.gmail.com',
          :port                 => '587',
          :enable_starttls_auto => true,
          :user_name            => 'info@liquid-concept.ch',
          :password             => @@config['mailer']['password'],
          :authentication       => :plain,
          :domain               => "localhost.localdomain"
        },
        :charset  => 'utf-8',
        :subject  => @@config['mailer']['subject'],
        :body     => template.result(binding),
        :headers  => {
          'Reply-To' => params[:message_request][:mail],
          'From' => 'no-reply@liquid-concept.ch'
        }
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
      @dates = Date.order('position ASC')
      @texts = Text.order('position ASC')
      @prices = Price.order('position ASC')
      @message = String.new

      erb :"admin/index", locals: { message: @message, prices: @prices, texts: @texts, dates: @dates }
    end

    put '/publish_date' do
      @dates = Date.order('position ASC')
      @texts = Text.order('position ASC')
      @prices = Price.order('position ASC')

      params[:dates].each do |key, date_text|
        date = Date.find(key.to_i)
        date.update_attribute(:date, date_text)
      end

      system 'rm public/index.html'
      system 'bundle exec nanoc compile'

      @message = 'Les dates ont été publiées'

      erb :"admin/index", locals: { message: @message, prices: @prices, texts: @texts, dates: @dates }
    end

    put '/publish_text' do
      @dates = Date.order('position ASC')
      @texts = Text.order('position ASC')
      @prices = Price.order('position ASC')

      params[:texts].each do |key, value|
        text = Text.find(key.to_i)
        text.update_attribute(:text, value)
      end

      system 'rm public/index.html'
      system 'bundle exec nanoc compile'

      @message = 'La promotion a été publiées'

      erb :"admin/index", locals: { message: @message, prices: @prices, texts: @texts, dates: @dates }
    end

    put '/publish_price' do
      @dates = Date.order('position ASC')
      @texts = Text.order('position ASC')
      @prices = Price.order('position ASC')

      params[:prices][:amount_default].each do |key, value|
        price = Price.find(key.to_i)
        price.update_attribute(:amount_default, value)
      end

      params[:prices][:amount_promo].each do |key, value|
        price = Price.find(key.to_i)
        price.update_attribute(:amount_promo, value)
      end

      params[:prices][:promo_active].each do |key, value|
        price = Price.find(key.to_i)
        price.update_attribute(:promo_active, value)

        if price.promo_active
          price.update_attribute(:amount, price.amount_promo)
        else
          price.update_attribute(:amount, price.amount_default)
        end
      end

      system 'rm public/index.html'
      system 'bundle exec nanoc compile'

      @message = 'Les tarifs ont été publiés'

      erb :"admin/index", locals: { message: @message, prices: @prices, texts: @texts, dates: @dates }
    end
  end
end
