require 'machinist/active_record'
require 'sham'

Dir[File.expand_path(File.dirname(__FILE__) + "/blueprints/*.rb")].each { |f| require f }
