module CurrentUserConcern
    extend ActiveSupport::Concern

    def current_user
        super || guest_user
    end

    def guest_user
        #GuestUser es una clase que está dentro de la carpeta models
        guest = GuestUser.new
        guest.name = "Guest User"
        guest.first_name = "Guest"
        guest.last_name = "User"
        guest.email = "guest@example.com"
        guest #Return a guest
    end
end