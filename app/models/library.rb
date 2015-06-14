class Library < ActiveRecord::Base

  has_many :libraries_users
  has_many :users, through: :libraries_users

end
