module Lita
  module Handlers
    class Directions < Handler
	
		route(/^(?:how\s+far\s+is\s+it\s+from\s+)?(.+)\s+to(.+)/i, :get_directions, command: true )
	
		def get_directions(response)
			from = response.matches[0][0]
			to = response.matches[0][1]
			json_ip_url = "https://maps.googleapis.com/maps/api/directions/json?origin=#{from}&destination=#{to}"
			results = JSON.parse(RestClient.get(json_ip_url))
			if results['routes'].any?
				response.reply("It is #{results['routes'][0]['legs'][0]['distance']['text'].gsub('mi', 'miles')} or #{results['routes'][0]['legs'][0]['duration']['text'].gsub('mins', 'minutes')} from #{results['routes'][0]['legs'][0]['start_address'].gsub(', USA', '').gsub(/\d{5}/, '')} to #{results['routes'][0]['legs'][0]['end_address'].gsub(', USA', '').gsub(/\d{5}/, '')}")
				response.reply(URI.encode("https://www.google.com/maps/dir/#{from}/#{to}/"))
			else
				response.reply(["Umm, you might want to double-check that.", "I think you did it wrong.", "There was an error, I think it was your fault.", "I'm pretty sure you messed up."].sample)
			end
		end
		
    end

    Lita.register_handler(Directions)
  end
end
