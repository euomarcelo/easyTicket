class PilaPacksController < ApplicationController
  before_action :set_pila_pack, only: [:show, :edit, :update, :destroy, :buy]

  respond_to :html

  def index
    @pila_packs = PilaPack.all
    respond_with(@pila_packs)
  end

  def show
    respond_with(@pila_pack)
  end

  def new
    @pila_pack = PilaPack.new
    respond_with(@pila_pack)
  end

  def edit
  end

  def create
    @pila_pack = PilaPack.new(pila_pack_params)
    @pila_pack.save
    respond_with(@pila_pack)
  end

  def update
    @pila_pack.update(pila_pack_params)
    respond_with(@pila_pack)
  end

  def destroy
    @pila_pack.destroy
    respond_with(@pila_pack)
  end
  
  def buy
    current_user.decrement(:balance, @pila_pack.real_value)
    current_user.save
  end

  private
    def set_pila_pack
      @pila_pack = PilaPack.find(params[:id])
    end

    def pila_pack_params
      params.require(:pila_pack).permit(:name, :real_value, :pila_value)
    end
end
