require 'httparty'

module Nike
	
	class Api
		include HTTParty
		
		@device_id = ENV['DEVICE_ID']
		@access_token = ENV["ACCESS_TOKEN"]
		
		headers  'Accept' => 'application/json', 'appid' => 'fuelband', 'Content-Type' => "application/json"
		
		def self.get_profile 
			get "https://api.nike.com/v1.0/me/profile?access_token=#{@access_token}"
		end
		
		def self.get_device_info
			get "https://api.nike.com/v1.0/me/me/device/#{@device_id}?access_token=#{@access_token}"
		end
		
		def self.get_events
			get "http://prd-msp-keryx.nike.com/events/connect/#{@device_id}"
		end
		
		def self.get_daily_goals
			get "https://api.nike.com/v1.0/me/challenge/dailygoal/list?access_token=#{@access_token}&startTime=1339272840000&endTime=1339276475000"
		end
		
		def self.get_activities
			# DDMMYY
			start_date = "010612"
			end_date = "090612"
			fidelity = "96"
			get "https://api.nike.com/v1.0/me/activities/summary/#{start_date}?deviceId=#{@device_id}&access_token=#{@access_token}&endDate=#{end_date}&fidelity=#{fidelity}"
		end
			
		
	end

end