class Calculator < ApplicationRecord
  belongs_to :user

  OPERATIONS = %w{+ - * / ** sqrt}.freeze

  validates :operation, :a, presence: true
  validates :a, numericality: { greater_than: 0 }
  validates :b, presence: true, numericality: { greater_than: 0 }, unless: Proc.new { |a| a.operation == 'sqrt' }
  validates :operation, inclusion: { in: Calculator::OPERATIONS }

  before_save :calculate

  def calculate
    self.result =
      if operation == 'sqrt'
        Math.sqrt(a)
      else
        a.public_send operation, b
      end
  end
end
