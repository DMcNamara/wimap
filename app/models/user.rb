class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  belongs_to :site
  include RoleModel
  # using https://github.com/martinrehfeld/role_model for role_mask
  roles :super_admin, :site_admin, :user

  # returns an array of strings containing all possible roles
  def self.human_readable_roles_array
    return User.valid_roles.map {|s| s.to_s.humanize}
  end

  #returns an array of strings contating a single user's roles
  def human_readable_roles_array
    return self.roles.map {|s| s.to_s.humanize.proper}
  end

  # returns a comma seperated string of all the user's roles
  def role_string
    return self.human_readable_roles_array * ", "
  end
end
