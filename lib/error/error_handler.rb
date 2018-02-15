# Error module to Handle errors globally
# include Error::ErrorHandler in application_controller.rb
module Error
    module ErrorHandler
      def self.included(clazz)
        # Raised when Instagram returns the HTTP status code 400
        clazz.class_eval do
          rescue_from Instagram::BadRequest, with: :re_authenticate
        end
      end
  
      private
      def re_authenticate
        redirect_to login_path 
      end
    end
  end
