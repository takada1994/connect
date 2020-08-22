class User < ApplicationRecord
has_secure_password

# varidates :name, presence: true
validates :email, {uniqueness: true}
end
