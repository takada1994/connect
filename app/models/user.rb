class User < ApplicationRecord

# varidates :name, presence: true

validates :email, {uniqueness: true}

end
