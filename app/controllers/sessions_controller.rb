class SessionsController < ApplicationController
    CALLBACK_URL = Rails.env.production? ? 'https://clonegram2018.herokuapp.com/oauth/callback' : 'http://localhost:3000/oauth/callback'

    def connect
        redirect_to Instagram.authorize_url(redirect_uri: CALLBACK_URL)
    end

    def callback
        unless params[:error].nil?
            flash[:warning] = params["You denied authorization"]
            return redirect_to root_path
        end
        response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)
        session[:access_token] = {
            access_token: response.access_token,
            username: response.user.username,
            profile_picture: response.user.profile_picture
        }
        redirect_to dashboard_path
    end

    def destroy
        session.delete(:access_token)
        flash[:success] = "Sign out success"
        redirect_to root_path
    end
end
