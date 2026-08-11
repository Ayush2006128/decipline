class HomeController < ApplicationController
  def index
    @habbits = Habbit.all
  end
end
