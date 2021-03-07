class ListingController < ApplicationController
  def page
    @places = Places.all 
  end
end
