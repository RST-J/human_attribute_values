class CreateNumericModels < ActiveRecord::Migration
  def change
    create_table :numeric_models do |t|
      t.integer :integer_field
      t.decimal :decimal_field

      t.timestamps
    end
  end
end
