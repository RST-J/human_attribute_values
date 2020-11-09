class CreateArrayModels < ActiveRecord::Migration[6.0]
  def change
    create_table :array_models do |t|
      t.string :currencies, array: true
      t.timestamps
    end
  end
end
