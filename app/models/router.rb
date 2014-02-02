class Router < ActiveRecord::Base
  validates :site_id, :x, :y, :z, :uid, :power, :frequency, presence: true
  
  belongs_to :site
end
