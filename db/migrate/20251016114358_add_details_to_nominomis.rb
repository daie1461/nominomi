class AddDetailsToNominomis < ActiveRecord::Migration[7.1]
  def change
    add_column :nominomis, :lat, :float
    add_column :nominomis, :lng, :float
  end
end
