class RemoveCarriageTypeFromCarriages < ActiveRecord::Migration[5.1]
  def change
    remove_column :carriages, :carriage_type, :string
  end
end
