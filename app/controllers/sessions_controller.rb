class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authentivate(params[:session][:password])
    else
      flash.now[:danger] = 'Failed login'
      render :new
    end
  end
end
