class Pokemon < ApplicationRecord
    has_many :moves, dependent: :destroy
end
