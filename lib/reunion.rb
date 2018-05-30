require_relative 'activity.rb'
class Reunion
  attr_reader :location, :activities
  def initialize(location)
    @location = location
    @activities = []
  end

  def add_activity(name, base_cost = 0, cost_per_participant = 0)
    new_activity = Activity.new(name, base_cost, cost_per_participant)
    @activities << new_activity
    return new_activity
  end
end
