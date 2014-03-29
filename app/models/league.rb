class League < ActiveRecord::Base

  belongs_to :sport
  validates :sport, presence: true

  validates :name, presence: true

end
