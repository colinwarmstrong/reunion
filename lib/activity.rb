class Activity
  attr_reader :name, :participants, :base_cost, :cost_per_participant

  def initialize(name, base_cost, cost_per_participant)
    @name = name
    @participants = {}
    @base_cost = base_cost
    @cost_per_participant = cost_per_participant
  end

  def add_participant(participant)
    @participants[participant] = 0
  end

  def total_cost
    @cost_per_participant * @participants.length + @base_cost
  end

end
