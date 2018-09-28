class HomeController < ApplicationController
  layout 'home'
  def index
  end

  def sitemaps
    respond_to do |format|
      format.xml
    end
  end

  def robots
    respond_to :text
    expires_in 6.hours, public: true
  end
end
