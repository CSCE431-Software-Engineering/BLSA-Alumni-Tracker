class AddFkRemoveUni < ActiveRecord::Migration[7.0]
  def change
    remove_column :education_infos, :University

    add_column :education_infos, :user_id, :bigint
    add_column :education_infos, :university_id, :bigint

    add_index :education_infos, :user_id
    add_index :education_infos, :university_id

    add_foreign_key :education_infos, :users, column: :user_id
    add_foreign_key :education_infos, :universities, column: :university_id
  end
end
