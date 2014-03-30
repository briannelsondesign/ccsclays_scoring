class Sport < ActiveRecord::Base

  validates :name, presence: true

  has_many :leagues

end
