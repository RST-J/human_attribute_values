superclass = ActiveRecord::Migration
superclass = ActiveRecord::Migration[5.1] if superclass.respond_to?(:[])

class CreateLexicons < superclass
  def change
    create_table :lexicons do |t|
      t.timestamps
    end
  end
end
