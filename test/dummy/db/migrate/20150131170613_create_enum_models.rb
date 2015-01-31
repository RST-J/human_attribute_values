class CreateEnumModels < ActiveRecord::Migration
  def change
    create_table :enum_models do |t|
      t.integer :status

      t.timestamps
    end
  end
end
