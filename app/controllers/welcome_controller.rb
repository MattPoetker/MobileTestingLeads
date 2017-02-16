class WelcomeController < ApplicationController
	require 'http'
	require "net/http"
	require "uri"

	def index
		
	end
	def show
		@url = params[:field]

		uri = URI('https://searchconsole.googleapis.com/v1/urlTestingTools/mobileFriendlyTest:run')
		@response = Net::HTTP.post_form(uri, 'url' => @url, 'requestScreenshot' => false, 'key' => 'AIzaSyD8Abp3X5U4bZBFuyPoIUd3LfZOLbVeKX8')
		
	end
end
