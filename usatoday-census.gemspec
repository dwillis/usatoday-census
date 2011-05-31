# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "usatoday-census/version"

Gem::Specification.new do |s|
  s.name        = "usatoday-census"
  s.version     = Usatoday::Census::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Derek Willis"]
  s.email       = ["dwillis@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Wrapper for USA Today Census API}
  s.description = %q{Retrieves state population and demographic information.}

  s.rubyforge_project = "usatoday-census"
  
  s.add_dependency "shoulda"
  s.add_dependency "json"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
