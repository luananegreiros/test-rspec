class AddAttsToWeapons < ActiveRecord::Migration[6.1]
  def change
    add_column :weapons, :name, :string
    add_column :weapons, :description, :string
    add_column :weapons, :power_base, :integer
    add_column :weapons, :power_step, :integer
    add_column :weapons, :level, :integer
  end
end
