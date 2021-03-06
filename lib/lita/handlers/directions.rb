module Lita
  module Handlers
    class Directions < Handler
	
		def self.default_config(config)
			config.api_key = nil
		end
	
		route(/^(?:how\s+do\s+I\s+you\s+get\s+far\s+is\s+it\s+from\s+)?(.+)\s+to(.+)/i, :get_directions, command: true )
	
		def get_directions(response)
			if Lita.config.handlers.directions.api_key.nil?
				response.reply("Please get an API key from https://console.developers.google.com, and follow the instructions on https://github.com/cashman04/lita-directions to configure.")
				return
			end
			from = response.matches[0][0]
			to = response.matches[0][1]
			json_ip_url = "https://maps.googleapis.com/maps/api/directions/json?origin=#{from}&destination=#{to}&key=#{Lita.config.handlers.directions.api_key}"
			results = JSON.parse(RestClient.get(json_ip_url))
			if results['routes'].any?
				response.reply("It is a #{results['routes'][0]['legs'][0]['distance']['text'].gsub('mi', 'miles')} drive from #{results['routes'][0]['legs'][0]['start_address'].gsub(', USA', '').gsub(/\d{5}/, '')} to #{results['routes'][0]['legs'][0]['end_address'].gsub(', USA', '').gsub(/\d{5}/, '')}. The approximate drive time is #{results['routes'][0]['legs'][0]['duration']['text'].gsub('mins', 'minutes')}.")
				response.reply(URI.encode("https://www.google.com/maps/dir/#{from}/#{to}/"))
			else
				response.reply(["Umm, you might want to double-check that.", "I think you did it wrong.", "There was an error, I think it was your fault.", "I'm pretty sure you messed up.", "Are you sure you read the directions?"].sample)
			end
		end
		
    end

    Lita.register_handler(Directions)
  end
end
