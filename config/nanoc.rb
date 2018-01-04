# encoding: utf-8
$: << File.expand_path('../..', __FILE__)

require 'rubygems' if RUBY_VERSION < '1.9'
require 'bundler/setup'

require 'sass'
require 'compass'

require 'sprockets'
require 'sprockets-sass'
require 'nanoc-sprockets-filter'
require 'nanoc-gzip-filter'
require 'uglifier'

#
# Nanoc
#
module Nanoc
  def self.production?
    ENV['RACK_ENV'] == 'production'
  end

  def self.development?
    !production?
  end
end

# Fix for ruby 2.4
module Arel
  module Visitors
    class DepthFirst < Arel::Visitors::Visitor
      alias :visit_Integer :terminal
    end

    class Dot < Arel::Visitors::Visitor
      alias :visit_Integer :visit_String
    end

    class ToSql < Arel::Visitors::Visitor
      alias :visit_Integer :literal
    end
  end
end

#
# Compass
#
Compass.add_project_configuration 'config/compass.rb'

#
# Sprockets
#
Nanoc::Helpers::Sprockets.configure do |config|
  config.environment = Nanoc::Filters::Sprockets.environment
  config.prefix      = '/assets'
  config.digest      = Nanoc.production?
end

# Fix bug with Sprockets namespace
module Sprockets
  module Sass
    Engine = ::Sass::Engine
  end
end if defined? ::Sass::Engine
