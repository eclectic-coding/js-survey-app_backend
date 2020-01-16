class CreateResponses < ActiveRecord::Migration[6.0]
  def change
    create_table :responses do |t|
      t.belongs_to :surveys
      t.string :responses

      t.timestamps
    end
  end
end
