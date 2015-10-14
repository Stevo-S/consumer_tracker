class Account < ActiveRecord::Base
    has_many :users
    has_and_belongs_to_many :account_types, join_table: :account_types_accounts
    
    accepts_nested_attributes_for :account_types
end
