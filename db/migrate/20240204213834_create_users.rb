class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :First_Name
      t.string :Last_Name
      t.string :Middle_Name
      t.string :Profile_picture
      t.string :Email
      t.string :Phone_Number
      t.string :Current_Job
      t.string :Location
      t.string :Linkedin_Profile
      t.boolean :is_Admin

      t.timestamps
    end
  end
end
