class AddPositionToPortafolios < ActiveRecord::Migration[6.0]
  def change
    add_column :portafolios, :position, :integer
  end
end
