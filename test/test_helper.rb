require 'test/unit'
require 'rubygems'
require 'shoulda'
require 'json'

%w(base exceptions location ethnicity housing population race).each do |f|
  require File.join(File.dirname(__FILE__), '../lib/usatoday-census', f)
end

include Usatoday::Census

# set your USAT Census API key as an environment variable to run the tests
API_KEY = ENV['USAT_CENSUS_API_KEY']
Base.api_key = API_KEY

module TestUsatoday
end