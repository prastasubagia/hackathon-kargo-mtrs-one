defmodule KargoBe.Repo.Migrations.CreateTransporters do
  use Ecto.Migration

  def change do
    create table(:transporters) do
      add :name, :string, null: false

      timestamps()
    end

  end
end
