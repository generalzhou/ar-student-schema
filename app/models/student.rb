require_relative '../../db/config'

# implement your Student model here
class Student < ActiveRecord::Base

  attr_accessor :first_name, :last_name, :gender, :email, :phone, :birthday
  # validates :email, :uniqueness => true

  validates :email, :format => { :with => /.+@.+\..{2,}/, 
                                :message => "must be a valid email" }
  validates :age


  def initialize

  end

  def age
    now = Time.now
    now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
  end

  def name
    first_name + ' ' + last_name
  end

end
