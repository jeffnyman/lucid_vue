require 'tapestry'
require 'data_builder'

include RSpec::Matchers

Dir["#{File.dirname(__FILE__)}/../config/config.rb"].each {|f| require f}
Dir["#{File.dirname(__FILE__)}/../models/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  include Tapestry::Factory

  config.formatter = "documentation"
  config.color = true
  config.before(:example) { Tapestry.set_browser :chrome }
  config.after(:example)  { Tapestry.quit_browser }
end
