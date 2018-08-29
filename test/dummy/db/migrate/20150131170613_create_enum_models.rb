superclass = ActiveRecord::Migration
superclass = ActiveRecord::Migration[5.1] if superclass.respond_to?(:[])

class CreateEnumModels < superclass
  def change
    create_table :enum_models do |t|
      t.integer :status

      t.timestamps
    end
  end
end
