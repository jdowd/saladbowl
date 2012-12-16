class WelcomeController < ApplicationController

  def home
    @game = Game.new
  end
  
end
