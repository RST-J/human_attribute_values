class CreateTheAnswers < ActiveRecord::Migration
  def change
    create_table :the_answers do |t|
      t.string :ultimate_truth

      t.timestamps
    end
  end
end
