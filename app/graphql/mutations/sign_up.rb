# frozen_string_literal: true
module Mutations
  # SignUp
  class SignUp < BaseMutation
    field :account, Types::AccountType, null: false
    field :token, String, null: false

    argument :email, String, required: true
    argument :password, String, required: true

    def resolve(**args)
      account = Account.create!(args)

      { account: account, token: account.jwt }
    end
  end
end
