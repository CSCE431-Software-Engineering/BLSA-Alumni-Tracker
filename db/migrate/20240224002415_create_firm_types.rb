class CreateFirmTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :firm_types do |t|
      t.string :firm_type

      t.timestamps
    end
  end
end
