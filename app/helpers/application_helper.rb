module ApplicationHelper
    def current_theme
        if current_user.present?
            current_user.theme
        else
            'light'
        end
    end
end
