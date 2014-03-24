class SessionsController < ApplicationController
  # GET /login
  def index
    flash[:error] = "Authentication could not proceed.  Please ensure that javascript is enabled."
    redirect_to root_url
  end

  # POST /login
  def create
    respond_to_browserid
  end

  # POST /logout
  def destroy
    logout_browserid
    head :ok
  end
end
