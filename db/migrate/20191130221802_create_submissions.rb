class CreateSubmissions < ActiveRecord::Migration[6.0]
  def change
    create_table :submissions do |t|
      t.integer :submission_id
      t.jsonb :form
      t.jsonb :lead
      t.jsonb :results
      t.datetime :date_submitted

      t.timestamps
    end
  end
end
