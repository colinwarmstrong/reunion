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

  def calculate_total_cost_of_reunion
    @activities.inject(0) do |total_reunion_cost, activity|
      total_reunion_cost += activity.total_cost
      total_reunion_cost
    end
  end

  def calculate_total_amounts_owed
    amounts_owed = Hash.new(0)
    @activities.each do |activity|
      activity.participants.each do |participant|
        amounts_owed[participant[0]] += activity.amount_owed(participant[0]).round(2)
      end
    end
    return amounts_owed
  end

  def output_total_amounts_owed
    amounts_owed = calculate_total_amounts_owed
    amounts_owed.each do |participant|
      puts "#{participant[0]} owes $#{participant[1]}"
    end
  end
end
