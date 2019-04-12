defmodule AbuDhabiMuayThai.AccountMgmt.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :active, :boolean, default: false
    field :date_joined, :utc_datetime
    field :description, :string
    field :email, :string
    field :name, :string
    field :password, :binary
    field :role_id, :integer

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :password, :description, :active, :role_id, :date_joined])
    |> validate_required([:name, :email, :password, :description, :active, :role_id, :date_joined])
  end
end
