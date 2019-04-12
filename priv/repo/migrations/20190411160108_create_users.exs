defmodule AbuDhabiMuayThai.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :string
      add :password, :binary
      add :description, :text
      add :active, :boolean, default: false, null: false
      add :role_id, :integer
      add :date_joined, :utc_datetime

      timestamps()
    end

  end
end
