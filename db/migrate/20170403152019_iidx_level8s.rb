class IidxLevel8s < ActiveRecord::Migration[5.0]
  def change
    create_table :iidx_level8s do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
