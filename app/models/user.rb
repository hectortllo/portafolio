class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #Validar que el atributo 'name' exista
  validates_presence_of :name

  def first_name
    #Teniendo una cadena larga, tomar solo la primer palabra de esa cadena
    self.name.split.first
  end

  def last_name
    self.name.split.last
  end
end
