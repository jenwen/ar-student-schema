require_relative '../../db/config'

class Student < ActiveRecord::Base

  def name
    "#{first_name} #{last_name}"
  end

  def age
    Time.now.year - birthday.year
  end

end