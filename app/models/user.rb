class User < ActiveRecord::Base

  has_secure_password

  has_many :libraries_users
  has_many :libraries, through: :libraries_users

  def self.confirm(params)
    @user = User.find_by(email: params[:email])
    @user.try(:authenticate, params[:password])
  end

end
