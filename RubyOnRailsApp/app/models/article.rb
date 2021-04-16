class Article < ApplicationRecord
    has_rich_text :content #nombre arbitrario
    belongs_to :user #campo adicional
    has_many :has_categories
    has_many :categories, through: :has_categories # Esto produce una relacion de muchos a muchos entre article y category
    attr_accessor :category_elements # Esto es como  definir una propiedad al objeto que puede leer y escribir como getter y setter

        def save_categories
            #category_elements 1,2,3
            #Convertir esto en un arreglo 1,2,3 >>>[1,2,3]
            categories_array = category_elements.split(",")
            #Iterar el arreglo
            categories_array.each do |category_id|
            #Crear el HasCategory HasCategory<article_id: 1, category_id: 2>
            # Esta condicion hace que no se cree duplicados
            #Forma1
            unless HasCategory.where(article:self, category_id).any? #inverso de if es unless
                HasCategory.create(article: self, category_id: category_id) #El self es como this en java
            end
            #Forma2
            # Esto hace que 
            #HasCategory.find_or_create_by(article: self, category_id: category_id)
        end
    end
end