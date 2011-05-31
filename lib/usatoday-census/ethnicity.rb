module Usatoday
  module Census
    class Ethnicity < Base
      
      TEXT_FIELDS = %w(place_name state_postal)
      NUMERIC_FIELDS = %w(fips gnis)
      DECIMAL_FIELDS = %w(pct_hispanic pct_non_hispanic_white usat_diversity_index)
      
      ALL_FIELDS = TEXT_FIELDS + DECIMAL_FIELDS + NUMERIC_FIELDS
      
      attr_reader *ALL_FIELDS
      
      def initialize(params={})
				params.each_pair do |k,v|
					instance_variable_set("@#{k}", v)
				end
			end
      
      def self.init_from_api(params)
        ethnicity = Ethnicity.new(
        :place_name => text_field(params['Placename']),
        :state_postal => text_field(params['StatePostal']),
        :fips => integer_field(params['FIPS']),
        :gnis => integer_field(params['GNIS']),
        :pct_hispanic => float_field(params['PctHisp']),
        :pct_non_hispanic_white => float_field(params['PctNonHispWhite']),
        :usat_diversity_index => float_field(params['USATDiversityIndex'])
        )
        ethnicity
      end
      
      def self.search(keypat, keyname=nil)
        params = prepare_params(keypat, keyname)
  			response = invoke('ethnicity', params)
  			init_from_api(response)
      end   
      
    end
  end
end