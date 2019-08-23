class PortafoliosController < ApplicationController
    def index
        @portfolio_items = Portafolio.all
    end

    def new
        @portfolio_item = Portafolio.new
    end

    def create
        @portfolio_item = Portafolio.new(params.require(:portafolio).permit(:title, :subtitle, :body))
    
        respond_to do |format|
          if @portfolio_item.save
            format.html { redirect_to portafolios_path, notice: 'Blog was successfully created.' }
          else
            format.html { render :new }
          end
        end
      end
end
