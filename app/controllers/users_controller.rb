class UsersController < ApplicationController
  before_filter :authenticate_user!

  respond_to :html

  def index
    @users = User.all
    respond_with(@users)
  end

  def show
    @user = User.find(params[:id])

    respond_to do |format|
        format.html # show.html.erb
        format.xml { render :xml => @user }
    end
  end
end