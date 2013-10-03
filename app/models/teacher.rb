require_relative '../../db/config'

class Student < ActiveRecord::Base
  validates :email, :uniqueness => true
end