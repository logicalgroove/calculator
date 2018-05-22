class CreateCalculators < ActiveRecord::Migration[5.2]
  def change
    create_table :calculators do |t|
      t.string :operation
      t.float :a
      t.float :b
      t.float :result

      t.timestamps
    end
  end
end
