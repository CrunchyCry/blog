module ApplicationHelper
    def current_theme
        if current_user.present?
            'dark'
        else
            'light'
        end
    end
end
