require 'rubygems'
require 'gettext'
require 'test/unit'
require 'mocha'
required_directories = ['lib']

required_directories.each do |dir|
  Dir.glob(File.join(File.dirname(__FILE__), "/../#{dir}/*.rb")).each {|f| require f }
end