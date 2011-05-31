# usatoday-census


* [Source](http://github.com/dwillis/usatoday-census)

## DESCRIPTION:

Simple ruby wrapper for the [USA TODAY Census API](http://developer.usatoday.com/docs/read/Census). You'll need an API key.

## INSTALL:

* <tt>gem install usatoday-census</tt>

## USAGE:

    require 'rubygems'
    require 'usatoday-census'
    include Usatoday::Census

You'll want to set your API key as an environment variable in order to run the tests. Otherwise, you'll need to set it like so:

    Base.api_key = YOUR_API_KEY
  
or via an environment variable:

    API_KEY = ENV['USAT_CENSUS_API_KEY']
    Base.api_key = API_KEY
  
The gem queries the USA TODAY Census API to return information about a state's population, ethnicity, housing, racial composition and other geographic details, including the USA TODAY Diversity Index. The initial version of the gem supports state-level requests, so the results will be for states only. Future support for other geographic levels (National, County and City or Town) will be added soon. Users can search for a state by its postal abbreviation or name:

    Location.search('va') # find demographic information about Virginia
    Ethnicity.search("Virginia", "Placename") # can also search by full state name using the Placename attribute.
    Race.search("51", 'FIPS') # Or search by FIPS code, too.

Check out the tests for further examples. Run the tests via rake test. Note: you'll need to set your API key as an environment variable before running the tests. The API has a limit of two queries per second, so the test requests are delayed by one second to ensure passage.

## Note on Patches/Pull Requests

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## LICENSE:

(The MIT License)

Copyright (c) 2011 Derek Willis

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.