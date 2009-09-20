require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('form-builder-generator', '0.1.0') do |p|
  p.project        = "formbuildergenerator"
  p.description    = "A form builder generator for Rails."
  p.url            = "http://github.com/bensie/form-builder-generator"
  p.author         = 'James Miller'
  p.email          = "james (at) bensie (dot) com"
  p.ignore_pattern = ["script/*"]
  p.development_dependencies = []
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }
