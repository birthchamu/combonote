class CombosController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :upadate, :destroy]

  def index
    @combos = Combo.all
  end

  def new
    @combo = Combo.new
  end

  def create
    @combo = Combo.new(combos_params)
    if @combo.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def combos_params
    params.require(:combo).permit(:start_percent, :combo_route, :memo, :fighter_id).merge(user_id: current_user.id)
  end


end
