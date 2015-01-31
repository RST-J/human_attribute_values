class CreateParents < ActiveRecord::Migration
  def change
    create_table :parents do |t|
      t.string :type
      t.string :field

      t.timestamps
    end
  end
end
