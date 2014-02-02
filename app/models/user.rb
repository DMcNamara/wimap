class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  belongs_to :site
  include RoleModel
  # using https://github.com/martinrehfeld/role_model for role_mask
  roles :super_admin, :site_admin, :user

  def self.human_readable_roles_array
    return User.valid_roles.map {|s| s.to_s.humanize}
  end
end
