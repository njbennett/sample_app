class ApplicationController < ActionController::Base
  
  def bees
    render text: "\"Bees are good,\" Obama says, as children scream."
  end
end
