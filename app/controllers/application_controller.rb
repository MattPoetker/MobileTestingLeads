class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  skip_before_filter :verify_authenticity_token

  def test
  	@url = params[:field]
  	@response = Net::HTTP.get_response("https://searchconsole.googleapis.com/v1/urlTestingTools/mobileFriendlyTest:run?url=#{@url}&requestScreenshot=true&key=AIzaSyD8Abp3X5U4bZBFuyPoIUd3LfZOLbVeKX8")
  	
  end
end
