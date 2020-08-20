class CreateHightlights < ActiveRecord::Migration[6.0]
  def change
    create_table :hightlights do |t|
      t.string :name
      t.string :video

      t.timestamps
    end
  end
end
