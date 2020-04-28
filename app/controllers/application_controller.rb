class ApplicationController < ActionController::Base
        before_action :configure_permitted_parameters, if: :devise_controller?

        protected

                def after_sign_in_path_for(resource)
                        root_path
                end
                def after_sign_out_path_for(resource)
                        root_path
                end
                def configure_permitted_parameters
                        devise_parameter_sanitizer.permit(:sign_up, keys: allowed_use_params)
                        devise_parameter_sanitizer.permit(:account_update, keys: allowed_use_params)
                end
        private
                def allowed_use_params
                        # %i[first_name last_name]
                        %i[name]

                end
end
