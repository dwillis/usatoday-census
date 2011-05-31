module Usatoday
  module Census
    class Location < Base
      
      TEXT_FIELDS = %w(place_name place_name_full state_ap state_postal)
      NUMERIC_FIELDS = %w(fips gnis population housing_units)
      DECIMAL_FIELDS = %w(pct_change pct_hispanic pct_non_hispanic pct_white pct_non_hispanic_white pct_black pct_american_indian pct_asian pct_native_hawaiian pct_two_or_more pct_other usat_diversity_index population_density land_square_miles water_square_miles total_square_miles latitude longitude pct_vacant)
      
      ALL_FIELDS = TEXT_FIELDS + DECIMAL_FIELDS + NUMERIC_FIELDS
      
      attr_reader *ALL_FIELDS
      
      def initialize(params={})
				params.each_pair do |k,v|
					instance_variable_set("@#{k}", v)
				end
			end
      
      def self.init_from_api(params)
        location = Location.new(
        :place_name => text_field(params['Placename']),
        :place_name_full => text_field(params['PlacenameFull']),
        :state_ap => text_field(params['StateAP']),
        :state_postal => text_field(params['StatePostal']),
        :fips => integer_field(params['FIPS']),
        :gnis => integer_field(params['GNIS']),
        :population => integer_field(params['Pop']),
        :housing_units => integer_field(params['HousingUnits']),
        :pct_change => float_field(params['PctChange']),
        :pct_hispanic => float_field(params['PctHisp']),
        :pct_non_hispanic => float_field(params['PctNonHisp']),
        :pct_white => float_field(params['PctWhite']),
        :pct_non_hispanic_white => float_field(params['PctNonHispWhite']),
        :pct_black => float_field(params['PctBlack']),
        :pct_american_indian => float_field(params['PctAmInd']),
        :pct_asian => float_field(params['PctAsian']),
        :pct_native_hawaiian => float_field(params['PctNatHawOth']),
        :pct_two_or_more => float_field(params['PctTwoOrMore']),
        :pct_other => float_field(params['PctOther']),
        :usat_diversity_index => float_field(params['USATDiversityIndex']),
        :population_density => float_field(params['PopSqMi']),
        :land_square_miles => float_field(params['LandSqMi']),
        :water_square_miles => float_field(params['WaterSqMi']),
        :total_square_miles => float_field(params['TotSqMi']),
        :latitude => float_field(params['Lat']),
        :longitude => float_field(params['Long']),
        :pct_vacant => float_field(params['PctVacant'])
        )
        location
      end
    
      def self.search(keypat, keyname=nil)
        params = prepare_params(keypat, keyname)
  			response = invoke('locations', params)
  			init_from_api(response)
      end
    end
  end
end