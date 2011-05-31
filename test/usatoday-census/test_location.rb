class TestUsatoday::TestLocation < Test::Unit::TestCase
	include Usatoday::Census  
	context "Location.new" do
		setup do
		  sleep(1)
		  response = Base.invoke('locations', {'keypat' => 'va'})
			@location = Location.init_from_api(response)
		end
		
		should "return an object of the Location type" do
			assert_kind_of(Location, @location)
		end
  end
  
  context "Location.new with placename" do
    setup do
      sleep(1)
      @location = Location.search('Virginia', 'Placename')
    end
		should "return an object of the Location type" do
			assert_kind_of(Location, @location)
		end
	end

  context "Location.new with FIPS" do
    setup do
      sleep(1)
      @location = Location.search(51, 'FIPS')
    end
		should "return an object of the Location type" do
			assert_kind_of(Location, @location)
		end
	end


end