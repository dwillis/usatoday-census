module Usatoday
  module Census
    class Race < Base
      
      TEXT_FIELDS = %w(place_name state_postal)
      NUMERIC_FIELDS = %w(fips gnis)
      DECIMAL_FIELDS = %w(pct_white pct_black pct_american_indian pct_asian pct_native_hawaiian pct_two_or_more)
      
      ALL_FIELDS = TEXT_FIELDS + DECIMAL_FIELDS + NUMERIC_FIELDS
      
      attr_reader *ALL_FIELDS
      
      def initialize(params={})
				params.each_pair do |k,v|
					instance_variable_set("@#{k}", v)
				end
			end
      
      def self.init_from_api(params)
        race = Race.new(
        :place_name => text_field(params['Placename']),
        :state_postal => text_field(params['StatePostal']),
        :fips => integer_field(params['FIPS']),
        :gnis => integer_field(params['GNIS']),
        :pct_white => float_field(params['PctWhite']),
        :pct_black => float_field(params['PctBlack']),
        :pct_american_indian => float_field(params['PctAmInd']),
        :pct_asian => float_field(params['PctAsian']),
        :pct_native_hawaiian => float_field(params['PctNatHawOth']),
        :pct_two_or_more => float_field(params['PctTwoOrMore'])
        )
        race
      end
      
      def self.search(keypat, keyname=nil)
        params = prepare_params(keypat, keyname)
  			response = invoke('race', params)
  			init_from_api(response)
      end   
      
    end
  end
end