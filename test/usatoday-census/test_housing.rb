class TestUsatoday::TestHousing < Test::Unit::TestCase
	include Usatoday::Census  
	context "Housing.new" do
		setup do
		  sleep(1)
		  response = Base.invoke('housing', {'keypat' => 'va'})
			@housing = Housing.init_from_api(response)
		end
		
		should "return an object of the Housing type" do
			assert_kind_of(Housing, @housing)
		end
  end
  
  context "Housing.new with placename" do
    setup do
      sleep(1)
      @housing = Housing.search('Virginia', 'Placename')
    end
		should "return an object of the Housing type" do
			assert_kind_of(Housing, @housing)
		end
		should "return the correct results" do
		  @housing.housing_units == 3364939
	  end
	end

  context "Housing.new with FIPS" do
    setup do
      sleep(1)
      @housing = Housing.search(51, 'FIPS')
    end
		should "return an object of the Housing type" do
			assert_kind_of(Housing, @housing)
		end
		should "return the correct results" do
		  @housing.housing_units == 3364939
	  end
	end


end