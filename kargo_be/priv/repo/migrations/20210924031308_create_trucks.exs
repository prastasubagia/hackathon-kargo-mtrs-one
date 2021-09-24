defmodule KargoBe.Repo.Migrations.CreateTrucks do
  use Ecto.Migration

  def change do
    create table(:trucks) do
      add :license_number, :string, default: "", null: false
      add :license_type, :string, default: "yellow", null: false
      add :production_year, :integer, null: true
      add :stnk_path, :string, null: true
      add :kir_path, :string, null: true
      add :status, :boolean, default: true, null: false
      add :truck_type, references(:truck_types, on_delete: :nothing)

      timestamps()
    end

  end
end
