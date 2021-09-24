defmodule KargoBe.Repo.Migrations.CreateTruckTypes do
  use Ecto.Migration

  def change do
    create table(:truck_types) do
      add :name, :string

      timestamps()
    end

    create unique_index(:truck_types, [:name])
  end
end
