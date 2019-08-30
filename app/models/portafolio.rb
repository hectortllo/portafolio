class Portafolio < ApplicationRecord
    validates_presence_of :title, :body, :main_image, :thumb_image

    #Función para hacer una consulta where
    def self.angular
        where(subtitle: "Angular")
    end

    #Otra forma de hacer una consulta where
    scope :ruby_on_rails_portfolio_items, -> { where(subtitle: "Ruby on Rails")}
end
