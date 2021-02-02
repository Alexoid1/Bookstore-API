class Book < ApplicationRecord
    validates :title, presence: true
    validates :author, presence: true
    validates :category, presence: true
end
