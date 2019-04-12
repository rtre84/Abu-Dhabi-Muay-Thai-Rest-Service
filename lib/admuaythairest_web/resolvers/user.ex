defmodule AbuDhabiMuayThaiWeb.Resolvers.AccountMgmt do
  alias AbuDhabiMuayThai.AccountMgmt

  def users(_, _, _) do
    {:ok, AccountMgmt.list_users()}
  end

  def user(_, %{id: id}, _) do
    {:ok, AccountMgmt.get_user!(id)}
  end
end
