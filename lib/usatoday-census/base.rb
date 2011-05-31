require 'open-uri'
require 'json'
require 'htmlentities'

module Usatoday
  module Census
    class Base
      
      API_SERVER = "api.usatoday.com"
      API_NAME = "census"
      API_BASE = "/open/#{API_NAME}"
      
      @@api_key = nil
      @@debug = true
      @@decode_html_entities = true
      
      def self.api_key=(key)
        @@api_key = key
      end

      def self.api_key
        @@api_key
      end
    
      def self.build_request_url(method, params)
        URI::HTTP.build :host => API_SERVER, 
        :path => API_BASE + '/' + method, 
        :query => params.map {|k,v| "#{URI.escape(k)}=#{URI.escape(v.to_s)}"}.join('&')
      end
    
      def self.text_field(value)
        return nil if value.nil?
        @@decode_html_entities ? HTMLEntities.new.decode(value) : value
      end
    
      def self.integer_field(value)
        return nil if value.nil?
        value.to_i
      end
      
      def self.float_field(value)
        return nil if value.nil?
        value.to_f
      end
    
      def self.prepare_params(method, keyname=nil)
        params = {"keypath" => method }
        params["keyname"] = keyname if keyname
        params
      end

      
      def self.invoke(method, params={})
        begin
          raise AuthenticationError, "You must initialize the API key before you run any API queries" if @@api_key.nil?
          
          full_params = params.merge 'api_key' => @@api_key
          uri = build_request_url(method, full_params)	
          puts "REQUEST: #{uri}" if @@debug
          
          reply = uri.read
          parsed_reply = JSON.parse reply
          
          raise BadResponseError, "Empty reply returned from API" if parsed_reply.nil?
          parsed_reply['response'].first
        rescue OpenURI::HTTPError => e
          case e.message
            when /^400/
              raise BadRequestError
            when /^403/
              raise AuthenticationError
            when /^404/
              return nil
            when /^500/
              raise ServerError
            else
              raise ConnectionError
            end
          raise "Error connecting to URL #{uri} #{e}"
        rescue JSON::ParserError => e
          raise BadResponseError, "Invalid JSON returned from API:\n#{reply}"          
        end
      end
    end
  end
end