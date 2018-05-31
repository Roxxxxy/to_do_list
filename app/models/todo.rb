class Todo < ApplicationRecord
  validates_presence_of :name, :due_date, :note

  validates_uniqueness_of :name

  def can_destroy?
    !overdue?
  end


  private

  def overdue?
    due_date < Date.today
  end
end
