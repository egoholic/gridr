require 'simplecov'
require "codeclimate-test-reporter"

SimpleCov.start
CodeClimate::TestReporter.start

require File.expand_path("../../lib/gridr", __FILE__)
Dir["./spec/support/**/*.rb"].sort.each {|f| require f}

RSpec.configure do |config|

  config.order = "random"
end
