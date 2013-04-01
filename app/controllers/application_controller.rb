class ApplicationController < ActionController::Base
  protect_from_forgery

  def render_404
    return render :template => "global/404", :status => :not_found
  end
end
