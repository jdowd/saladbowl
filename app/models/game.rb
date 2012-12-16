# == Schema Information
#
# Table name: games
#
#  id         :integer          not null, primary key
#  started_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Game < ActiveRecord::Base
  has_many :teams
  
  attr_accessible :started_at
  
  
  def create_two_teams
    2.times do
      teams << Team.create
    end
    assign_players_to_teams
  end
  
  def assign_players_to_teams
    adults = Player.adults.all.shuffle
    kids = Player.kids.all.shuffle
    team1 = teams.first
    team2 = teams.second
    
    count_of_adults = adults.size
    count_of_kids = kids.size
    
    adults.each do |adult|
      team1.players << adult
    end
    kids.each do |kid|
      team1.players << kid
    end
    

    
    (count_of_adults / 2).times do 
      team2.players << adults.pop
    end
    
    (rand(2) + count_of_kids / 2).times do 
      team2.players << kids.pop
    end
    
    
  end
  
  
end
