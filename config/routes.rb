Rails.application.routes.draw do
  resources :portafolios

#  get 'pages/home'
  #Se cambiaron las rutas para entrar a las diferentes páginas con una ruta más sencilla
  get 'about-me', to: 'pages#about' # localhost:3000/about-me
  get 'contact', to: 'pages#contact' #localhost:3000/contact
  



  resources :blogs
  
  root to: 'pages#home' #Esta página será la página principal del sitio - localthost:3000/home
end
