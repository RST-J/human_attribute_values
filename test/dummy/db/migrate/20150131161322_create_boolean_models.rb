superclass = ActiveRecord::Migration
superclass = ActiveRecord::Migration[5.1] if superclass.respond_to?(:[])

class CreateBooleanModels < superclass
  def change
    create_table :boolean_models do |t|
      t.boolean :boolean_field

      t.timestamps
    end
  end
end
