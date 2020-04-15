class CreateSurveys < ActiveRecord::Migration[6.0]
  def up
    create_table :surveys do |t|
      t.string :name
      t.integer :yes

      t.timestamps
    end
  end

  def down 
    drop_table :surveys
  end
end
