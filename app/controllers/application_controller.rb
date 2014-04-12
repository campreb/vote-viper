class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  private

  def current_responder
    private_key = session[:responder_key] || params[:key]
    Responder.where(private_key: private_key).first if private_key.present?
  end

end
