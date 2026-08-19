require "test_helper"

class HabbitTest < ActiveSupport::TestCase
  test "is daily when due_date is empty" do
    habbit = Habbit.new(description: "Read", completion_status: false, user: users(:one), due_date: nil)

    assert_predicate habbit, :daily_task?
  end

  test "is not daily when due_date is present" do
    habbit = habbits(:one)

    assert_not_predicate habbit, :daily_task?
  end
end
