defmodule KargoBe.Drivers.Driver do
  use Ecto.Schema
  import Ecto.Changeset

  schema "drivers" do
    field :driver_license, :string
    field :driver_name, :string
    field :id_card, :string
    field :phone_number, :string
    field :status, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(driver, attrs) do


    driver
    |> cast(attrs, [:driver_name, :phone_number, :status, :id_card, :driver_license])
    |> validate_required([:driver_name, :phone_number, :status])
    |> unique_constraint(:phone_number)
  end
end
