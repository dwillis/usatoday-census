module Usatoday
  module Census
    class Housing < Base
      
      TEXT_FIELDS = %w(place_name state_postal)
      NUMERIC_FIELDS = %w(fips gnis housing_units)
      DECIMAL_FIELDS = %w(pct_vacant)
      
      ALL_FIELDS = TEXT_FIELDS + DECIMAL_FIELDS + NUMERIC_FIELDS
      
      attr_reader *ALL_FIELDS
      
      def initialize(params={})
				params.each_pair do |k,v|
					instance_variable_set("@#{k}", v)
				end
			end
      
      def self.init_from_api(params)
        housing = Housing.new(
        :place_name => text_field(params['Placename']),
        :state_postal => text_field(params['StatePostal']),
        :fips => integer_field(params['FIPS']),
        :gnis => integer_field(params['GNIS']),
        :pct_vacant => float_field(params['PctHisp']),
        :housing_units => integer_field(params['HousingUnits'])
        )
        housing
      end
      
      def self.search(keypat, keyname=nil)
        params = prepare_params(keypat, keyname)
  			response = invoke('housing', params)
  			init_from_api(response)
      end   
      
    end
  end
end