class TestUsatoday::TestRace < Test::Unit::TestCase
	include Usatoday::Census  
	context "Race.new" do
		setup do
		  sleep(1)
		  response = Base.invoke('race', {'keypat' => 'va'})
			@race = Race.init_from_api(response)
		end
		
		should "return an object of the Race type" do
			assert_kind_of(Race, @race)
		end
  end
  
  context "Race.new with placename" do
    setup do
      sleep(1)
      @race = Race.search('Virginia', 'Placename')
    end
		should "return an object of the Race type" do
			assert_kind_of(Race, @race)
		end
	end

  context "Race.new with FIPS" do
    setup do
      sleep(1)
      @race = Race.search(51, 'FIPS')
    end
		should "return an object of the Race type" do
			assert_kind_of(Race, @race)
		end
	end


end