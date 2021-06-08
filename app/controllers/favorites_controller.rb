class FavoritesController < ApplicationController
  before_action :set_combo
  before_action :authenticate_user!

  # お気に入り登録
  def create
    if @combo.user_id != current_user.id   # 投稿者本人以外に限定
      @favorite = Favorite.create(user_id: current_user.id, combo_id: @combo.id)
    end
  end
  # お気に入り削除
  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, combo_id: @combo.id)
    @favorite.destroy
  end

  private
  def set_combo
    @combo = Combo.find(params[:combo_id])
  end
end
