superclass = ActiveRecord::Migration
superclass = ActiveRecord::Migration[5.1] if superclass.respond_to?(:[])

class CreateTheAnswers < superclass
  def change
    create_table :the_answers do |t|
      t.string :ultimate_truth
      t.references :lexicon, index: true

      t.timestamps
    end
  end
end
