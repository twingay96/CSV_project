class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :firstname, :string
    add_column :users, :Lastname, :string
    add_column :users, :food, :string 
    
  end
end
