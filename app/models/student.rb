require_relative '../../db/config'

class Student < ActiveRecord::Base
  validates :email, :uniqueness => true
  validates :email, :format => { :with => /\w+@{1}\w+\.\w{2,}/, :message => "Invalid email address"}
  validates :age, :numericality => {:greater_than => 5}

  ### NOT PASSING THIS VALIDATION ###
  # validates :phone, :format => { :with => /\d{3}-\d{3}-\d{4}/, :message => "Invalid phone"}

  def name
    "#{first_name} #{last_name}"
  end

  def age
    @age = Time.now.year - birthday.year
  end

end