class Category < ApplicationRecord
    has_many :has_categories
    has_many :articles, through: :has_categories # Esto produce una relacion de muchos a muchos entre article y category
end
