class Transfer
  attr_reader :sender, :receiver, :amount, :status

  @@all = []

  def initialize (sender, receiver, amount)
      @sender = sender
      @receiver = receiver
      @amount = amount
      @status = "pending"
      @@all << self
  end

  def valid?
    @sender.valid? and @receiver.valid?
  end

  def execute_transaction
    if @status == "pending" and @sender.balance >= @amount and @receiver.valid?
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    elsif @status != "complete"
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete" and self.valid?
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end

  def self.all
      @@all
  end
end