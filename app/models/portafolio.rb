class Portafolio < ApplicationRecord
    has_many :technologies
    include Placeholder
    validates_presence_of :title, :body, :main_image, :thumb_image

    #Función para hacer una consulta where
    def self.angular
        where(subtitle: "Angular")
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

