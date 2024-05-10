class User < ApplicationRecord
    #has_secure_password

    validates :name,:surname, presence: true, uniqueness: true
end
