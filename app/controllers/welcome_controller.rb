class WelcomeController < ApplicationController
	require 'http'
	require "net/http"
	require "uri"

	def index
		
	end
	def show
		if uri?(params[:field])
			@url = params[:field]
			uri = URI('https://searchconsole.googleapis.com/v1/urlTestingTools/mobileFriendlyTest:run')
			
			uri.query = URI.encode_www_form('url' => @url, 'requestScreenshot' => true, 'key' => 'AIzaSyD8Abp3X5U4bZBFuyPoIUd3LfZOLbVeKX8')

			res = Net::HTTP.get_response(uri)
			puts res.body if res.is_a?(Net::HTTPSuccess)


			uri = URI('https://searchconsole.googleapis.com/v1/urlTestingTools/mobileFriendlyTest:run')
			@response = Net::HTTP.post_form(uri, 'url' => @url, 'requestScreenshot' => true, 'key' => 'AIzaSyD8Abp3X5U4bZBFuyPoIUd3LfZOLbVeKX8')
			@result = JSON.parse(@response.body)
	
		else
			@url = 'http://' + params[:field]
			uri = URI('https://searchconsole.googleapis.com/v1/urlTestingTools/mobileFriendlyTest:run')
			@response = Net::HTTP.post_form(uri, 'url' => @url, 'requestScreenshot' => true, 'key' => 'AIzaSyD8Abp3X5U4bZBFuyPoIUd3LfZOLbVeKX8')
			@result = JSON.parse(@response.body)
		
		end
	end
	private
	def uri?(string)
  		uri = URI.parse(string)
  		%w( http https ).include?(uri.scheme)
	rescue URI::BadURIError
  		false
	rescue URI::InvalidURIError
  		false
	end
end
