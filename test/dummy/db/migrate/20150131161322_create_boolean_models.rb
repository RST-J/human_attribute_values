class CreateBooleanModels < ActiveRecord::Migration
  def change
    create_table :boolean_models do |t|
      t.boolean :boolean_field

      t.timestamps
    end
  end
end
