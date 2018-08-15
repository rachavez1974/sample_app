class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def hello
  	render html: "Previet Kah De Lah!"
  	
  end
end
