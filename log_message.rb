require 'time'
module Logger
    LOG_FILE='app.log'
  
    # def log(type, message)
    #     timestamp = Time.now.iso8601
    #     File.open(LOG_FILE, 'a') do |file|
    #         file.puts "#{timestamp} -- #{type} -- #{message}"
    #     end
    # end
    
    @logs=[:info, :warning, :error]
    @logs.each do |type| 
        define_method("log_#{type}") do |message|
            timestamp = Time.now.iso8601
            File.open(LOG_FILE,'a') do |file|
                file.puts "#{timestamp} -- #{type} -- #{message}"
            end #end File 
        end #end define_method
    end #end each

end

class User
    attr_accessor :name , :balance 
    def initialize(name, balance)
        @name=name
        @balance=balance
    end
end

class Transaction
     attr_reader :user , :value
     def initialize(user,value)
        @user=user
        @value=value
     end
end

class Bank
    def process_transactions(transaction,&block)
        raise "method #{__method__} is abstract"
    end
end

class CBABank < Bank
  include Logger
  attr_accessor :users

  def initialize(users)
    @users = users
  end

  def process_transactions(transactions, &block)
    transactions.map do |transaction|
      user = transaction.user

      if @users.include?(user)
        new_balance = user.balance + transaction.value

        if new_balance < 0
          log_error("User #{user.name} transaction with value #{transaction.value} failed with message Not enough balance")
          block.call("Call endpoint for failure of User #{user.name} transaction with value #{transaction.value} with reason Not enough balance")if block

        elsif new_balance > 0
          user.balance = new_balance
          block.call("Call endpoint for success of User #{user.name} transaction with value #{transaction.value}")if block

        elsif new_balance == 0
          user.balance = new_balance
          block.call("Call endpoint for success of User #{user.name} transaction with value #{transaction.value}")if block
          log_warning("#{user.name} has 0 balance")
        end
      else
        log_error("User #{user.name} transaction with value #{transaction.value} failed with message #{user.name} not exist in the bank!!")
        block.call("Call endpoint for failure of User #{user.name} transaction with value #{transaction.value} with reason #{user.name} not exist in the bank!!")if block
      end
    end
  end
end


users = [
  User.new("Ali", 200),
  User.new("Peter", 500),
  User.new("Manda", 100)
]

out_side_bank_users = [
  User.new("Menna", 400),
]

transactions = [
  Transaction.new(users[0], -20),
  Transaction.new(users[0], -30),
  Transaction.new(users[0], -50),
  Transaction.new(users[0], -100),
  Transaction.new(users[0], -100),
  Transaction.new(out_side_bank_users[0], -100)
]

bank = CBABank.new(users)
bank.process_transactions(transactions)
bank.process_transactions(transactions) do |result|
  puts result
end