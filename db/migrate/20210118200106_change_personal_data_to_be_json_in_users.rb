class ChangePersonalDataToBeJsonInUsers < ActiveRecord::Migration[6.1]
  def up
    change_column :users, :personal_data, :jsonb, using: 'to_jsonb(personal_data)'
  end

  def down
    change_column :users, :personal_data, :string
  end
end
