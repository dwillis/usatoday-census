class TestUsatoday::TestEthnicity < Test::Unit::TestCase
	include Usatoday::Census
	
	context "Ethnicity.new" do
		setup do
		  sleep(1)
		  response = Base.invoke('ethnicity', {'keypat' => 'pa'})
			@ethnicity = Ethnicity.init_from_api(response.first)
		end
		
		should "return an object of the Ethnicity type" do
			assert_kind_of(Ethnicity, @ethnicity)
		end
  end
  
  context "Ethnicity.search with placename" do
    setup do
      sleep(1)
      @ethnicity = Ethnicity.search('Virginia', 'Placename').first
    end
		should "return an object of the Ethnicity type" do
			assert_kind_of(Ethnicity, @ethnicity)
		end
		should "return the correct results" do
		  @ethnicity.pct_hispanic == 0.078968
	  end
		
	end
	
  context "Ethnicity.search with FIPS" do
    setup do
      sleep(1)
      @ethnicity = Ethnicity.search(51, 'FIPS').first
    end
		should "return an object of the Ethnicity type" do
			assert_kind_of(Ethnicity, @ethnicity)
		end
		should "return the correct results" do
		  @ethnicity.pct_hispanic == 0.078968
	  end
	end
	
	context "Ethnicity.search with abbrev and county level" do
	  setup do
	    sleep(1)
	    @ethnicities = Ethnicity.search('va', nil, 3)
	  end
	  should "return multiple ethnicity objects" do
	    @ethnicities.size > 0
	  end
	  
	  should "return the correct place name for the first result" do
	    @ethnicities.first.place_name == 'Accomack'
	  end
	  
	end
end