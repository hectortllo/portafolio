class Portafolio < ApplicationRecord
    has_many :technologies

    #Relacionar varios modelos desde uno solo
    accepts_nested_attributes_for :technologies, 
            reject_if: lambda { |attrs| attrs['name'].blank? } #Esta línea es para validar que el nombre no quede vacío

    validates_presence_of :title, :body
    
    mount_uploader :thumb_image, PortafolioUploader
    mount_uploader :main_image, PortafolioUploader

    #Función para hacer una consulta where
    def self.angular
        where(subtitle: "Angular")
    end

    def self.by_position
        order("position ASC")
    end

    #Otra forma de hacer una consulta where
    scope :ruby_on_rails_portfolio_items, -> { where(subtitle: "Ruby on Rails")}

    #Después de crear (def create) este código se ejecutará    
end

