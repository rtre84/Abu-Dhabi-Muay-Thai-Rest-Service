defmodule AbuDhabiMuayThaiWeb.Schema.Schema do
  @moduledoc false
  use Absinthe.Schema

  query do
    @desc "Get a list of users"
    field :user, list_of(:user) do
      resolve &AbuDhabiMuayThaiWeb.Resolvers.AccountMgmt.users/3
    end

    @desc "Get a user by his/her id"
    field :user, :user do
      arg :id, non_null(:id)
      resolve &AbuDhabiMuayThaiWeb.Resolvers.AccountMgmt.users/3
    end
  end

  object :user do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :email, non_null(:string)
    field :active, non_null(:boolean)
  end
end
