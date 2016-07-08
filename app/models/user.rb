class User < ActiveRecord::Base
  validates :first_name, length: {minimum: 1, message: "Cannot be blank"} #, presence: true
  validates :last_name, length: {minimum: 1, message: "Cannot be blank"} #, presence: true
  validates :email, format: { message: "Must be a valid email", with: /.+@.+/} #, presence: true

  has_secure_password

  def admin?
    self.role == 'admin'
  end

  def fullname
    return self.first_name + ' ' + self.last_name
  end

end
