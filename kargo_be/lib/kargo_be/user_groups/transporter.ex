defmodule KargoBe.UserGroups.Transporter do
  use Ecto.Schema
  import Ecto.Changeset

  schema "transporters" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(transporter, attrs) do
    transporter
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
