class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.belongs_to :surveys
      t.string :responded

      t.timestamps
    end
  end
end
