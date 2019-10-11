class ApplicationController < ActionController::Base
  before_action :set_i18n_locale_from_params
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html { redirect_to main_app.root_url, :alert => exception.message }
    end
  end
  
  def default_url_options
    { locale: I18n.locale }
  end
  
  around_action :switch_locale
  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end
  
  def change_theme
    if current_user.theme == 'light' 
      current_user.theme = 'dark' 
       current_user.save 
       #link_to "dark mode", welcome_index_path, method: :get 
     else  
       current_user.theme = 'light' 
       current_user.save 
       #link_to "light mode", welcome_index_path, method: :get 
   end 
      #redirect_to :root
end

  protected
    def set_i18n_locale_from_params
      if params[:locale]
        if I18n.available_locales.map(&:to_s).include?(params[:locale])
          I18n.locale = params[:locale]
        else
          I18n.locale = :en
        end
      end
    end
    
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    end

    

    def extract_locale_from_tld
      parsed_locale = request.host.split('.').last
      I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
    end

    
end