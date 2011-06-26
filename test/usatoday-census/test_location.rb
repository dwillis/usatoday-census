class TestUsatoday::TestLocation < Test::Unit::TestCase
	include Usatoday::Census  
	context "Location.new" do
		setup do
		  sleep(1)
		  response = Base.invoke('locations', {'keypat' => 'va'})
			@location = Location.init_from_api(response.first)
		end
		
		should "return an object of the Location type" do
			assert_kind_of(Location, @location)
		end
  end
  
  context "Location.new with placename" do
    setup do
      sleep(1)
      @location = Location.search('Virginia', 'Placename').first
    end
		should "return an object of the Location type" do
			assert_kind_of(Location, @location)
		end
		
		should "return the correct hash of names" do
		  @location.state_postal == "VA"
	  end
	end

  context "Location.new with FIPS" do
    setup do
      sleep(1)
      @location = Location.search(51, 'FIPS').first
    end
		should "return an object of the Location type" do
			assert_kind_of(Location, @location)
		end
		
		should "return the correct result" do
		  @location.population == 8001024 
	  end
	end

	context "Location.search with abbrev and county level" do
	  setup do
	    sleep(1)
	    @locations = Location.search('va', nil, 3)
	  end
	  should "return multiple Location objects" do
	    @locations.size > 0
	  end
	  
	  should "return the correct place" do
	    @locations.first.place_name == 'Accomack'
	  end
	end


end