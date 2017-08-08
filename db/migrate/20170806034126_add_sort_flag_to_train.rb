class AddSortFlagToTrain < ActiveRecord::Migration[5.1]
  def change
    add_column :trains, :sort_flag, :boolean, default: true
  end
end
