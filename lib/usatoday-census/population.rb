module Usatoday
  module Census
    class Population < Base
      
      TEXT_FIELDS = %w(place_name state_postal)
      NUMERIC_FIELDS = %w(fips gnis population)
      DECIMAL_FIELDS = %w(pct_change population_density)
      
      ALL_FIELDS = TEXT_FIELDS + DECIMAL_FIELDS + NUMERIC_FIELDS
      
      attr_reader *ALL_FIELDS
      
      def initialize(params={})
				params.each_pair do |k,v|
					instance_variable_set("@#{k}", v)
				end
			end
      
      def self.init_from_api(params)
        population = Population.new(
        :place_name => text_field(params['Placename']),
        :state_postal => text_field(params['StatePostal']),
        :fips => integer_field(params['FIPS']),
        :gnis => integer_field(params['GNIS']),
        :pct_change => float_field(params['PctChange']),
        :population => integer_field(params['Pop']),
        :population_density => float_field(params['PopSqMi'])
        )
        population
      end
      
      def self.search(keypat, keyname=nil)
        params = prepare_params(keypat, keyname)
  			response = invoke('population', params)
  			init_from_api(response)
      end   
      
    end
  end
end