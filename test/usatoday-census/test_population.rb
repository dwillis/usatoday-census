class TestUsatoday::TestPopulation < Test::Unit::TestCase
	include Usatoday::Census  
	context "Population.new" do
		setup do
		  sleep(1)
		  response = Base.invoke('population', {'keypat' => 'va'})
			@population = Population.init_from_api(response.first)
		end
		
		should "return an object of the Population type" do
			assert_kind_of(Population, @population)
		end
  end
  
  context "Population.new with placename" do
    setup do
      sleep(1)
      @population = Population.search('Virginia', 'Placename').first
    end
		should "return an object of the Population type" do
			assert_kind_of(Population, @population)
		end
		should "return the correct results" do
		  @population.population_density == 202.6
	  end
	end

  context "Population.new with FIPS" do
    setup do
      sleep(1)
      @population = Population.search(51, 'FIPS').first
    end
		should "return an object of the Population type" do
			assert_kind_of(Population, @population)
		end
		should "return the correct results" do
  	  @population.population_density == 202.6
    end
	end


end