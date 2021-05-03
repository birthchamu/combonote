class CreateCombos < ActiveRecord::Migration[6.0]
  def change
    create_table :combos do |t|
      t.string     :start_percent, null:false
      t.string     :combo_route,   null:false
      t.text       :memo
      t.references :user,          null:false
      t.integer    :fighter_id,    null:false
      t.timestamps
    end
  end
end
