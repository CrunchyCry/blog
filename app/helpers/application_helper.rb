module ApplicationHelper
    def current_theme
        if current_user.role?
            'dark'
        else
            'light'
        end
    end
end
