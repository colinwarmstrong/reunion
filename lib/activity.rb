class Activity
  attr_reader :name, :participants, :base_cost, :cost_per_participant

  def initialize(name, base_cost = 0, cost_per_participant = 0)
    @name = name
    @participants = {}
    @base_cost = base_cost
    @cost_per_participant = cost_per_participant
  end

  def add_participant(participant, amount_paid = 0)
    @participants[participant] = amount_paid
  end

  def total_cost
    @cost_per_participant * @participants.length + @base_cost
  end

  def cost_per_person
    total_activity_cost = total_cost
    cost_per_person = total_activity_cost.to_f / @participants.length.to_f
    cost_per_person.round(2)
  end

  def amount_owed(participant)
    amount_to_be_paid = cost_per_person
    amount_owed = amount_to_be_paid - @participants[participant]
    amount_owed.round(2)
  end

end
