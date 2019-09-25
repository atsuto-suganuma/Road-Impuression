class RootController < ApplicationController
  def top
    @makers = Maker.all
  end

  def about
  	
  end
  
  def privacy_policy
  	
  end

  def terms_of_service
  	
  end
end
