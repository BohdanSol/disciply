# email:string
# password_digest:string
#
# password:string virtual
# password_confirbation:string virtual
class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, format: { with: /\A\S+@.+\.\S+\z/, message: 'Must be a valid email address' }
end
