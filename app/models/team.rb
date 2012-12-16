# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  game_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Team < ActiveRecord::Base
  belongs_to :game
  has_many :players
  
  attr_accessible :name
  
  before_create :get_funny_name
  
  
  
  
  private
    def get_funny_name
      adjectives = %w(
        Blasting Jumping Fuzzy Lazy Hyper Crazy Blue Orange Red Yellow Clumsy
        Bewildered Itchy Colossal Repulsive Eager Brave Witty Odd Melodic Inexpensive
        Grumpy Ugly Wide-eyed Chubby Zealous Nervous Obnoxious Raspy Mammouth Miniature
        Portly Panicky Helpless Obese Rotund Hissing Smelly
      )
      nouns = %w(
        Boogers Custards Ferraris Elephants Sunrises Santas Monkeys Bananas Doctors Tubs Kittens
        Zebras Ladybugs Fardingbags Furphies Armadillos Buzzards Blizzards Unicorns Pegasi Leftovers
        Losers Carcasses Zombies Platapusses Kangaroos Cookies Chicklets Chickens Infants Mutants Beards
        Moustaches Armpits Bottoms
      )
      funny_name = adjectives.sample + " " + nouns.sample
      self.name = funny_name
    end
end
