class Site < ActiveRecord::Base
  has_many :routers, dependent: :destroy
  has_many :users
end
