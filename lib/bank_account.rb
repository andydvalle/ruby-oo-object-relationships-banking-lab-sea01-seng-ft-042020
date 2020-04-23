class BankAccount
    attr_accessor :balance, :status
    attr_reader :name

    @@all = []

    def initialize (name)
        @name = name
        @balance = 1000
        @status = "open"

        @@all << self
    end

    def deposit (amount)
        @balance += amount
    end

    def display_balance 
        "Your balance is $#{@balance}."
    end

    def valid?
        @balance > 0 and @status == "open"
    end

    def close_account
        @status = "closed"
    end

    def self.all
        @@all 
    end
end
