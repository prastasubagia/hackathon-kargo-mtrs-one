defmodule KargoBe.Trucks.TruckType do
  use Ecto.Schema
  import Ecto.Changeset

  alias KargoBe.Trucks.Truck

  schema "truck_types" do
    field :name, :string
    has_many(:trucks, Truck)

    timestamps()
  end

  @doc false
  def changeset(truck_type, attrs) do
    truck_type
    |> cast(attrs, [:name])
    |> cast_assoc(:trucks)
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end
