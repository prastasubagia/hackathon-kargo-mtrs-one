defmodule KargoBe.Trucks.Truck do
  use Ecto.Schema
  import Ecto.Changeset

  alias KargoBe.Trucks.TruckType

  schema "trucks" do
    field :kir_path, :string
    field :license_number, :string
    field :license_type, :string
    field :production_year, :integer
    field :status, :boolean, default: false
    field :stnk_path, :string
    belongs_to(:truck_type, TruckType)

    timestamps()
  end

  @doc false
  def changeset(truck, attrs) do
    truck
    |> cast(attrs, [:license_number, :license_type, :production_year, :stnk_path, :kir_path, :status])
    |> validate_required([:license_number, :license_type, :status])
    |> assoc_constraint(:truck_type)
  end
end
