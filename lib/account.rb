require 'terminal-table'
require 'date'

class Account
  attr_reader :rows, :balance

  def initialize
    @balance = 0
    @rows = [['Date', 'Credit', 'Debit', 'Balance']]
  end

  def debit(amount)
    raise ArgumentError, "Must enter a number" unless(amount.is_a? Numeric)
    amount = amount.to_f
    @balance -= amount
    add_entry('debit', amount)
  end

  def credit(amount)
    raise ArgumentError, "Must enter a number" unless(amount.is_a? Numeric)
    amount = amount.to_f
    @balance += amount
    add_entry('credit', amount)
  end

  def add_entry(type, amount)
    if type == 'credit'
        entry = [date_today, amount.to_s, '-', @balance.to_s]
        insert_row(entry)
    elsif type == 'debit'
        entry = [date_today, '-', amount.to_s, @balance.to_s]
        insert_row(entry)
    end
  end

  def insert_row(entry)
    @rows.insert(1, :separator)
      @rows.insert(2, entry)
  end

  def print_statement
    puts Terminal::Table.new :rows => @rows
  end

  def date_today
    t = Time.now
    t.strftime('%x')
  end

end
