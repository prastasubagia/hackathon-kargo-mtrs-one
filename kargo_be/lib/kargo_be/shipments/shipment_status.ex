defmodule KargoBe.Shipments.ShipmentStatus do
  use Ecto.Schema
  import Ecto.Changeset

  schema "shipment_statuses" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(shipment_status, attrs) do
    shipment_status
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
