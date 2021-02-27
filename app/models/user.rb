class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, # Permite la autentificación del usuario
         :registerable, # Permite registrar usuarios
         :recoverable, # Permite recuperar su contraseña
         :rememberable, # Permite recordar su contraseña utilizando un sistema de cookies
         :validatable # Permite validar ciertos tipos de datos para poder acceder a la sesion

  has_many :tasks
end
