class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @combos = @user.combos

    favorites = Favorite.where(user_id: current_user.id).pluck(:combo_id)  # ログイン中のユーザーのお気に入りのcombo_idカラムを取得
    @favorite_list = Combo.find(favorites)
  end
end
