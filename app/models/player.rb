class Player < ActiveRecord::Base
  has_many :games,
    through: :gameplays
  has_many :pieces
end
