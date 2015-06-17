class UsersController < ApplicationController
  before_filter :authenticate_user!

  respond_to :html

  def index
    @users = User.all
    respond_with(@users)
  end

  def show
    @user = User.find(params[:id])
    @offers = Offer.where(:user_id => params[:id])
    @messages = Message.where(:userReceive => params[:id])

    respond_to do |format|
        format.html # show.html.erb
        format.xml { render :xml => @user }
    end
  end
end
