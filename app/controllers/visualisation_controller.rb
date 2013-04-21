class VisualisationController < ApplicationController
  before_filter :authenticate_user!
  # GET /visualisation
  def index

    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
end
