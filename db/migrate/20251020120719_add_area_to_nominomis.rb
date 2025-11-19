class AddAreaToNominomis < ActiveRecord::Migration[7.1]
  def change
    add_column :nominomis, :area, :string
  end
end
