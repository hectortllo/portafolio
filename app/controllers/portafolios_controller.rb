class PortafoliosController < ApplicationController
    def index
        @portfolio_items = Portafolio.all
    end
end
