class CreateEducationInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :education_infos do |t|
      t.string :Semester
      t.integer :Grad_Year
      t.string :University
      t.string :Degree_Type

      t.timestamps
    end
  end
end
