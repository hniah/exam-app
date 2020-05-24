class CreateTestsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.string :name
      t.text :description
    end

    create_table :questions do |t|
      t.string :label
      t.text :description
      t.belongs_to :test, index: true
    end

    create_table :options do |t|
      t.string :answer
      t.boolean :correct, default: false
      t.belongs_to :question, index: true
    end
  end
end
