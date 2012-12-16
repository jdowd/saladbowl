class PlayersController < ApplicationController

  def index
    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])
  end

  def new
    @player = Player.new
  end

  def edit
    @player = Player.find(params[:id])
  end

  def create
    @player = Player.new(params[:player])
    if @player.save
      redirect_to players_path, notice: 'Player was successfully created.'
    else
      render action: "new" 
    end
  end

  def update
    @player = Player.find(params[:id])
    if @player.update_attributes(params[:player])
      redirect_to @player, notice: 'Player was successfully updated.' 
    else
      render action: "edit"
    end
  end

  def destroy
    @player = Player.find(params[:id])
    @player.destroy
    redirect_to players_url
  end
end
