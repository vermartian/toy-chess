class Game < ActiveRecord::Base
  has_many :players,
    through: :gameplays
  has_many :pieces
end
