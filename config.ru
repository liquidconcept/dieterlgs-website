# encoding: utf-8
#\ -w
$: << File.expand_path('..', __FILE__)

require 'rubygems' if RUBY_VERSION < '1.9'
require 'bundler/setup'
require 'app/website'

map 'http://www.dieterlgs.ch/' do
  use Application::Website
end

map 'http://dieterlgs.ch/' do
  use Application::Website
end

map 'http://www.dieterlgs.ch/admin/' do
  use Application::Admin
end

map 'http://dieterlgs.ch/admin/' do
  use Application::Admin
end

# Temp

map 'http://9f3a865b0441421697f9504cbc10b702.testurl.ws/' do
  run Application::Website
end

map 'http://9f3a865b0441421697f9504cbc10b702.testurl.ws/admin/' do
  run Application::Admin
end
