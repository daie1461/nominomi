class CreateNominomis < ActiveRecord::Migration[7.1]
  def change
    create_table :nominomis do |t|
      t.string :spotname
      t.string :time
      t.string :seat
      t.string :menu
      t.text :tips
      t.string :tabe

      t.timestamps
    end
  end
end
