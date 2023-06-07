class ThemeController < ApplicationController
  def update
    cookies[:theme] = params[:theme]
    redirect_to(request.referrer || root_path)
  end

  def sidebar
    cookies[:sidebar] = params[:sidebar]
    redirect_to(request.referrer || root_path)
  end
end
