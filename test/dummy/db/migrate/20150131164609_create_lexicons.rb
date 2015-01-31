class CreateLexicons < ActiveRecord::Migration
  def change
    create_table :lexicons do |t|
      t.references :the_answer, index: true

      t.timestamps
    end
  end
end
