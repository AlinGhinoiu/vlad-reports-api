class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :email
      t.integer :sector, limit: 1
      t.string :role

      t.timestamps
    end
  end
end
