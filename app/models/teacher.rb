require_relative '../../db/config'

# implement your Student model here
class Teacher < ActiveRecord::Base

  validates :email, :format => { :with => /.+@.+\..{2,}/ }
  validates :email, :uniqueness => true
  validates :age, :exclusion => { :in => (0..3) }
  validate :must_have_valid_number

  def age
    now = Time.now
    now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
  end

  def name
    first_name + ' ' + last_name
  end

  def must_have_valid_number  
    errors.add(:phone, "must be 10 digits long") if phone.gsub(/\D/, '').length < 8
  end

end
