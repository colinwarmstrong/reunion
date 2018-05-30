require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'
class ActivityTest < Minitest::Test
  def test_it_exists
    activity = Activity.new('snorkeling', 200, 12)

    assert_instance_of Activity, activity
  end

  def test_activities_are_initialize_with_a_name_and_empty_participants_hash
    activity = Activity.new('loitering', 5000, 6)

    assert_equal 'loitering', activity.name
    assert_equal ({}), activity.participants
  end

  def test_activities_are_initialize_with_a_base_cost_and_cost_per_participant
    activity = Activity.new('light jogging', 70, 900)

    assert_equal 70, activity.base_cost
    assert_equal 900, activity.cost_per_participant
  end

  def test_it_can_add_participants
    activity = Activity.new('interpretive dance', -12, 16.4)

    assert_equal 0, activity.participants.length
    activity.add_participant('Billy Bob')
    assert_equal 1, activity.participants.length
    activity.add_participant('Billy Joe')
    assert_equal 2, activity.participants.length
    activity.add_participant('Billy Jean')
    assert_equal 3, activity.participants.length
  end

  def test_it_can_find_total_cost
    activity = Activity.new('running for mayor', 1, 1_000_000_000)
    activity.add_participant('Billy Goat')
    expected = activity.total_cost

    assert_equal 1_000_000_001, expected

    activity.add_participant('Billy Boy')
    expected = activity.total_cost

    assert_equal 2_000_000_001, expected
  end

  def test_it_can_calculate_cost_per_person
    activity = Activity.new('examining the duality of man', 10, 10)

    activity.add_participant('Harry')
    assert_equal 20, activity.cost_per_person

    activity.add_participant('Ron')
    assert_equal 15, activity.cost_per_person

    activity.add_participant('Hermionie')
    assert_equal 13.33, activity.cost_per_person
  end

  def test_it_calculate_amount_owed_for_each_participant
    activity = Activity.new('learning to love again', 100, 100)

    activity.add_participant('Harry', 50)
    assert_equal 150, activity.amount_owed('Harry')

    activity.add_participant('Ron', 10)
    assert_equal 140, activity.amount_owed('Ron')

    activity.add_participant('Hermionie', 500)
    assert_equal -366.67, activity.amount_owed('Hermionie')
  end
end
