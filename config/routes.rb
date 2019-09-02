Rails.application.routes.draw do

  #Las siguientes dos líneas de código se hacen para cambiar la ruta, al entrar a un solo
  #portafolio, la ruta ya no dirá 'portafolios/3' sino, 'portafolio/3'. Se cambia de plural
  #a singular. SE CREA UNA RUTA PROPIA.
  #Al hacer esto también se cambió la ruta en el archivo index.htm.erb en la sección del título
  #portfolio.item.title
  resources :portafolios, except: [:show]
  get 'angular-items', to: 'portafolios#angular'
  get 'portafolio/:id', to: 'portafolios#show', as: 'portfolio_show'

#  get 'pages/home'
  #Se cambiaron las rutas para entrar a las diferentes páginas con una ruta más sencilla
  get 'about-me', to: 'pages#about' # localhost:3000/about-me
  get 'contact', to: 'pages#contact' #localhost:3000/contact
  

  #Creating a custom route

  resources :blogs do
    member do
      get :toggle_status
    end
  end

  

  
  root to: 'pages#home' #Esta página será la página principal del sitio - localthost:3000/home
end
