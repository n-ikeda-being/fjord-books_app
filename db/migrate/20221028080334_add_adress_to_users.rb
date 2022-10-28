class AddAdressToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :postcode, :integer
    add_column :users, :address, :string
  end
end
