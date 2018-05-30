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
end
