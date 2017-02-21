class WelcomeController < ApplicationController
  def index
  end

  def sub_cities
    @cities = City.sub_cities(params["prov"])
  end
end
