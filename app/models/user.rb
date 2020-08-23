class User < ApplicationRecord

    #検索機能
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
    #ここまで

    has_secure_password

    validates :name, presence: true
    validates :email, {uniqueness: true}
end
