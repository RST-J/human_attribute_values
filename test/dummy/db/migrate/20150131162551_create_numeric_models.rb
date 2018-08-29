superclass = ActiveRecord::Migration
superclass = ActiveRecord::Migration[5.1] if superclass.respond_to?(:[])

class CreateNumericModels < superclass
  def change
    create_table :numeric_models do |t|
      t.integer :integer_field
      t.decimal :decimal_field

      t.timestamps
    end
  end
end
