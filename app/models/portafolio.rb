class Portafolio < ApplicationRecord
    has_many :technologies

    #Relacionar varios modelos desde uno solo
    accepts_nested_attributes_for :technologies, 
            reject_if: lambda { |attrs| attrs['name'].blank? } #Esta línea es para validar que el nombre no quede vacío

    include Placeholder
    validates_presence_of :title, :body, :main_image, :thumb_image

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
    after_initialize :set_defaults

    def set_defaults
        #Básicamente ||= lo que hace es esto:
        #if self.main_image == nil
        #    self.main_image = "http://placehold.it/600x200"
        #end
        self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
        self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
    end
end

