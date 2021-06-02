class CombosController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :upadate, :destroy]
  before_action :find_combo, only: [:edit, :update, :show, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
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

  def edit
  end

  def update
    if @combo.update(combos_params)
      redirect_to combo_path(@combo.id)
    else
      render :edit
    end
  end

  def show
    @comment = @combo.comments.build
    @comments = @combo.comments.includes(:user)
  end

  def destroy
    @combo.destroy
    redirect_to root_path
  end

  private
  def combos_params
    params.require(:combo).permit(:start_percent, :combo_route, :memo, :fighter_id).merge(user_id: current_user.id)
  end

  def find_combo
    @combo = Combo.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index if @combo.user.id != current_user.id 
  end

end
