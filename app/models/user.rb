class User < ApplicationRecord
    has_secure_password
    has_many :blogs, dependent: :destroy
    validates :username, presence: true, uniqueness: true

end
