require_relative '../lib/account.rb'
require 'terminal-table'

describe Account do

let(:account) { described_class.new }

  describe 'Opening an account' do
    it 'starts with a balance of 0' do
      expect(account.balance).to eq 0
    end
  end

  describe '#credit' do
    it 'adds money to the account' do
    account.credit(10)
    expect(account.balance).to eq 10
    end
    it 'raises an error if amount is nan' do
      expect {account.credit('nonsense')}.to raise_error("Must enter a number")
    end
  end

  describe '#debit' do
    before do
      account.credit(10)
    end

    it 'removes money from the account' do
      account.debit(5)
      expect(account.balance).to eq 5
    end
    it 'raises an error if amount is nan' do
      expect {account.debit('nonsense')}.to raise_error("Must enter a number")
    end
  end

end
