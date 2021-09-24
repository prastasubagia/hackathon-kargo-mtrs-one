defmodule KargoBe.Repo.Migrations.CreateDrivers do
  use Ecto.Migration

  def change do
    create table(:drivers) do
      add :driver_name, :string
      add :phone_number, :string
      add :status, :boolean
      add :id_card, :string
      add :driver_license, :string

      timestamps()
    end

  end
end
