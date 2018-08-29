superclass = ActiveRecord::Migration
superclass = ActiveRecord::Migration[5.1] if superclass.respond_to?(:[])

class CreateParents < superclass
  def change
    create_table :parents do |t|
      t.string :type
      t.string :field

      t.timestamps
    end
  end
end
