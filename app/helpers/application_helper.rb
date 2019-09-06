module ApplicationHelper
    def login_helper style = ''
        if current_user.is_a?(GuestUser)
            (link_to "Register", new_user_registration_path, class: style) +
            " ".html_safe + 
            (link_to "Log in", new_user_session_path, class: style)
        else
            link_to "Logout", destroy_user_session_path, method: :delete, class: style
        end
    end

    def source_helper(layout_name)
        #Si alguien tiene una sesión iniciada, se ejectuará esto
        if session[:source]
            greeting = "Thanks for visiting me from  #{session[:source]} and you are on the #{layout_name} layout"
            content_tag(:p, greeting, class: "source-greeting")
        end
    end

    #Este método sirve para llamar a la gema que yo creé. 
    def copyright_generator
        copyright = TelloViewTool::Renderer.copyright 'Héctor Tello', "Todos los derechos reservados"    
    end
end
