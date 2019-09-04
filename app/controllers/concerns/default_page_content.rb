module DefaultPageContent
    extend ActiveSupport::Concern

    included do
        before_action :set_pages_defaults
    end

    def set_pages_defaults
        @page_title = "Portafolio | Héctor Tello Website"
        @seo_keywords = "Héctor Tello Portafolio"
    end
end