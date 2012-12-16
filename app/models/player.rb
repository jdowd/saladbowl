# == Schema Information
#
# Table name: players
#
#  id         :integer          not null, primary key
#  birthday   :date
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  team_id    :integer
#

class Player < ActiveRecord::Base
  belongs_to :team
  
  attr_accessible :birthday, :name
  
  scope :adults, where('birthday <= ?', Date.today - 18.years)
  scope :kids, where('birthday > ?', Date.today - 18.years)

  def is_adult?
    birthday < (Date.today - 18.years)
  end
end
