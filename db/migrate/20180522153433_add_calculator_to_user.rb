class AddCalculatorToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :calculators, :user
  end
end
