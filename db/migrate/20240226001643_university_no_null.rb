class UniversityNoNull < ActiveRecord::Migration[7.0]
  def up
    change_column :universities, :University, :string, null: false
    add_index :universities, :University, unique: true
  end
end
