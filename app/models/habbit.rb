class Habbit < ApplicationRecord
  belongs_to :user
  validates :description, presence: true

  def daily_task?
    due_date.nil?
  end
end
