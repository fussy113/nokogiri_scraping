class CreateLevel10s < ActiveRecord::Migration[5.0]
  def change
    create_table :level10s do |t| #=> この引数名「:sensors」がテーブル名になる
      t.string :name
      t.timestamps
    end
  end
end
