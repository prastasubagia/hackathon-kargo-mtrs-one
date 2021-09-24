defmodule KargoBe.Repo.Migrations.CreateShipmentStatuses do
  use Ecto.Migration

  def change do
    create table(:shipment_statuses) do
      add :name, :string, null: false

      timestamps()
    end

  end
end
