class Site < ActiveRecord::Base
  validates :name, :latitude, :longitude, :range, presence: true
  has_many :routers, dependent: :destroy
  has_many :users
  has_many :navpoints
end
