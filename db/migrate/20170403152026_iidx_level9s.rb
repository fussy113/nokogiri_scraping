class IidxLevel9s < ActiveRecord::Migration[5.0]
  def change
    create_table :iidx_level9s do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
