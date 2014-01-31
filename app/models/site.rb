class Site < ActiveRecord::Base
  has_many :routers, dependent: :destroy
end
