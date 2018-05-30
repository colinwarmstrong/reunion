require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require './lib/reunion'

class ReunionTest < Minitest::Test
  def test_it_exists
    reunion = Reunion.new('Dark side of the moon')

    assert_instance_of Reunion, reunion
  end

  def test_reunions_have_a_location
    reunion = Reunion.new('South Dakota: the lesser of the two Dakotas')

    assert_equal 'South Dakota: the lesser of the two Dakotas', reunion.location
  end

  def test_it_can_add_activities
    reunion = Reunion.new("Davy Jones' locker")

    assert_equal [], reunion.activities

    safari = reunion.add_activity('safari adventure')
    assert_equal [safari], reunion.activities

    bowling = reunion.add_activity('extreme bowling adventure')
    assert_equal [safari, bowling], reunion.activities

    knitting = reunion.add_activity('ultra extreme ballistic knitting adventure')
    assert_equal [safari, bowling, knitting], reunion.activities
  end

  def test_it_can_calculate_total_cost_of_the_reunion
    reunion = Reunion.new('The bad part of Detroit')
    taxes = reunion.add_activity('Doing taxes', 10, 10)
    lawn_care = reunion.add_activity('Basic lawn maintenance', 50, 25)
    traffic = reunion.add_activity('Getting stuck in traffic', 100, 10)
    taxes.add_participant('Harry')
    taxes.add_participant('Ron')
    lawn_care.add_participant('Hermionie')
    traffic.add_participant('Ron')
    traffic.add_participant('Hermionie')

    assert_equal 225, reunion.calculate_total_cost_of_reunion
  end

  def test_it_can_calculate_amount_owed_per_person_for_entire_reunion
    reunion = Reunion.new('Somewhere near the Missouri-Arkansas border')
    winter = reunion.add_activity('Preparing for a long cold winter', 20, 10)
    vacation= reunion.add_activity('Taking a much needed vacation', 10, 25)
    inlaws = reunion.add_activity('Meeting your in-laws', 100, 10)
    winter.add_participant('Harry')
    winter.add_participant('Ron')
    vacation.add_participant('Harry')
    vacation.add_participant('Hermionie')
    inlaws.add_participant('Ron')
    inlaws.add_participant('Hermionie', 100)

    amounts_owed = reunion.calculate_total_amounts_owed

    assert_equal 50.00, amounts_owed['Harry']
    assert_equal 80.00, amounts_owed['Ron']
    assert_equal -10.00, amounts_owed['Hermionie']
  end
end
