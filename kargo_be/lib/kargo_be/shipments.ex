defmodule KargoBe.Shipments do
  @moduledoc """
  The Shipments context.
  """

  import Ecto.Query, warn: false
  alias KargoBe.Repo

  alias KargoBe.Shipments.ShipmentStatus

  @doc """
  Returns the list of shipment_statuses.

  ## Examples

      iex> list_shipment_statuses()
      [%ShipmentStatus{}, ...]

  """
  def list_shipment_statuses do
    Repo.all(ShipmentStatus)
  end

  @doc """
  Gets a single shipment_status.

  Raises `Ecto.NoResultsError` if the Shipment status does not exist.

  ## Examples

      iex> get_shipment_status!(123)
      %ShipmentStatus{}

      iex> get_shipment_status!(456)
      ** (Ecto.NoResultsError)

  """
  def get_shipment_status!(id), do: Repo.get!(ShipmentStatus, id)

  @doc """
  Creates a shipment_status.

  ## Examples

      iex> create_shipment_status(%{field: value})
      {:ok, %ShipmentStatus{}}

      iex> create_shipment_status(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_shipment_status(attrs \\ %{}) do
    %ShipmentStatus{}
    |> ShipmentStatus.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a shipment_status.

  ## Examples

      iex> update_shipment_status(shipment_status, %{field: new_value})
      {:ok, %ShipmentStatus{}}

      iex> update_shipment_status(shipment_status, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_shipment_status(%ShipmentStatus{} = shipment_status, attrs) do
    shipment_status
    |> ShipmentStatus.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a shipment_status.

  ## Examples

      iex> delete_shipment_status(shipment_status)
      {:ok, %ShipmentStatus{}}

      iex> delete_shipment_status(shipment_status)
      {:error, %Ecto.Changeset{}}

  """
  def delete_shipment_status(%ShipmentStatus{} = shipment_status) do
    Repo.delete(shipment_status)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking shipment_status changes.

  ## Examples

      iex> change_shipment_status(shipment_status)
      %Ecto.Changeset{data: %ShipmentStatus{}}

  """
  def change_shipment_status(%ShipmentStatus{} = shipment_status, attrs \\ %{}) do
    ShipmentStatus.changeset(shipment_status, attrs)
  end
end
