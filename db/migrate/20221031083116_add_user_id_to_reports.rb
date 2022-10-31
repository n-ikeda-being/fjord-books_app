class AddUserIdToReports < ActiveRecord::Migration[6.1]
  def change
    add_column :reports, :user_id, :integer
    add_column :reports, :user_name, :string
  end
end
