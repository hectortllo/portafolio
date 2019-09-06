class PortafoliosController < ApplicationController
  #El método before_action se ejecutará en los métodos edit, update, show y destroy
  #antes de ejecutar cualquier cosa
  before_action :set_portfolio_item, only: [:edit, :show, :update, :destroy,]
  layout "portafolio"
  access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all
  
  def index
    @portfolio_items = Portafolio.all
  end

  def angular
    @angular_portfolio_items = Portafolio.angular
  end

  def new
    @portfolio_item = Portafolio.new
    #build: básicamente, se van a instanciar 3 versiones de @portfolio_items
    3.times { @portfolio_item.technologies.build }
  end

  def create
    @portfolio_item = Portafolio.new(portafolio_params)

      #params.require(:portafolio).permit(:title, :subtitle, :body)
      #params.require(:portafolio).permit(:title, :subtitle, :body,technologies_attributes: [:name])
    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portafolios_path, notice: 'Blog was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @portfolio_item.update(portafolio_params)
        format.html { redirect_to portafolios_path, notice: 'The record successfully updated' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    #La línea de abajo funciona muy parecido como el byebug
    #binding.pry
  end

  def destroy

    #2. Destroy/Delete the record
    @portfolio_item.destroy

    #3. Redirect
    respond_to do |format|
      format.html { redirect_to portafolios_url, notice: 'Record was removed.' }
    end
  end

  private 
  def portafolio_params
    params.require(:portafolio).permit(:title, :subtitle, :body,technologies_attributes: [:name])
  end

  def set_portfolio_item
    @portfolio_item = Portafolio.find(params[:id])
  end
end
