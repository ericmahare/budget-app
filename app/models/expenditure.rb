class Expenditure < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :name, presence: true
  validates :amount, presence: true

  def total_expenditures(id)
    total = 0
    Expenditure.where(category_id: id).each do |expenditure|
      total += expenditure.amount
    end
    total
  end
end
