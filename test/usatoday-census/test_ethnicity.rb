class TestUsatoday::TestEthnicity < Test::Unit::TestCase
	include Usatoday::Census
	
	context "Ethnicity.new" do
		setup do
		  sleep(1)
		  response = Base.invoke('ethnicity', {'keypat' => 'pa'})
			@ethnicity = Ethnicity.init_from_api(response)
		end
		
		should "return an object of the Ethnicity type" do
			assert_kind_of(Ethnicity, @ethnicity)
		end
  end
  
  context "Ethnicity.new with placename" do
    setup do
      sleep(1)
      @ethnicity = Ethnicity.search('Virginia', 'Placename')
    end
		should "return an object of the Ethnicity type" do
			assert_kind_of(Ethnicity, @ethnicity)
		end
	end
	
  context "Ethnicity.new with FIPS" do
    setup do
      sleep(1)
      @ethnicity = Ethnicity.search(51, 'FIPS')
    end
		should "return an object of the Ethnicity type" do
			assert_kind_of(Ethnicity, @ethnicity)
		end
	end
	
end