class User < ApplicationRecord

    class << self
        def search(query)
            rel = order("name")
            if query.present?
                rel = rel.where("name LIKE ? OR id LIKE ?",
                "%#{query}%" , "%#{query}%")
            end
            rel
        end 
    end

    has_secure_password

    # varidates :name, presence: true
    validates :email, {uniqueness: true}
end
