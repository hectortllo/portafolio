class Skill < ApplicationRecord
    include Placeholder
    validates_presence_of :title, :percent_utilized

    #Después de crear (def create) este código se ejecutará
    after_initialize :set_defaults

    def set_defaults
        #Básicamente ||= lo que hace es esto:
        #if self.main_image == nil
        #    self.main_image = "http://placehold.it/600x200"
        #end
        self.badge ||= Placeholder.image_generator(height: '250', width: '250')
    end
end
