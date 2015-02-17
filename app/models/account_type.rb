class AccountType < ActiveRecord::Base
    has_many :bank_accounts
end
