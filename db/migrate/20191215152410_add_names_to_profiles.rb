class AddNamesToProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :full_name, :string
  end
end
