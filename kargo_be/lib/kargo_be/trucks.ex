defmodule KargoBe.Trucks do
  @moduledoc """
  The Trucks context.
  """

  import Ecto.Query, warn: false
  alias KargoBe.Repo

  alias KargoBe.Trucks.Truck

  @doc """
  Returns the list of trucks.

  ## Examples

      iex> list_trucks()
      [%Truck{}, ...]

  """
  def list_trucks(params) do
    if Map.has_key?(params, "license_number") || Map.has_key?(params, "truck_type_id") do
      truck_type_ids =
        if String.length(params["truck_type_id"]) > 0,
          do: String.split(params["truck_type_id"], ",") |> Enum.map(&String.to_integer/1),
          else: []
      license_number = params["license_number"]
      like1 = "%#{license_number}%"

      if length(truck_type_ids) > 0 do
        query =
          from t in "trucks",
            join: tt in "truck_types",
            on: t.truck_type_id == tt.id,
            where: like(t.license_number, ^like1),
            where: t.truck_type_id in ^truck_type_ids,
            select: %{
              id: t.id,
              license_number: t.license_number,
              license_type: t.license_type,
              production_year: t.production_year,
              stnk_path: t.stnk_path,
              kir_path: t.kir_path,
              status: t.status,
              truck_type: %{
                id: tt.id,
                name: tt.name
              }
            }

        Repo.all(query)
      else
        query =
          from t in "trucks",
            join: tt in "truck_types",
            on: t.truck_type_id == tt.id,
            where: like(t.license_number, ^like1),
            where: not is_nil(t.truck_type_id),
            select: %{
              id: t.id,
              license_number: t.license_number,
              license_type: t.license_type,
              production_year: t.production_year,
              stnk_path: t.stnk_path,
              kir_path: t.kir_path,
              status: t.status,
              truck_type: %{
                id: tt.id,
                name: tt.name
              }
            }

        Repo.all(query)
      end
    else
      Repo.all(Truck)
      |> Repo.preload(:truck_type)
    end
  end

  @doc """
  Gets a single truck.

  Raises `Ecto.NoResultsError` if the Truck does not exist.

  ## Examples

      iex> get_truck!(123)
      %Truck{}

      iex> get_truck!(456)
      ** (Ecto.NoResultsError)

  """
  def get_truck!(id) do
    Repo.get!(Truck, id)
    |> Repo.preload(:truck_type)
  end

  @doc """
  Creates a truck.

  ## Examples

      iex> create_truck(%{field: value})
      {:ok, %Truck{}}

      iex> create_truck(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_truck(attrs \\ %{}) do
    %Truck{}
    |> Truck.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a truck.

  ## Examples

      iex> update_truck(truck, %{field: new_value})
      {:ok, %Truck{}}

      iex> update_truck(truck, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_truck(%Truck{} = truck, attrs) do
    truck
    |> Truck.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a truck.

  ## Examples

      iex> delete_truck(truck)
      {:ok, %Truck{}}

      iex> delete_truck(truck)
      {:error, %Ecto.Changeset{}}

  """
  def delete_truck(%Truck{} = truck) do
    Repo.delete(truck)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking truck changes.

  ## Examples

      iex> change_truck(truck)
      %Ecto.Changeset{data: %Truck{}}

  """
  def change_truck(%Truck{} = truck, attrs \\ %{}) do
    Truck.changeset(truck, attrs)
  end

  alias KargoBe.Trucks.TruckType

  @doc """
  Returns the list of truck_types.

  ## Examples

      iex> list_truck_types()
      [%TruckType{}, ...]

  """
  def list_truck_types do
    Repo.all(TruckType)
  end

  @doc """
  Gets a single truck_type.

  Raises `Ecto.NoResultsError` if the Truck type does not exist.

  ## Examples

      iex> get_truck_type!(123)
      %TruckType{}

      iex> get_truck_type!(456)
      ** (Ecto.NoResultsError)

  """
  def get_truck_type!(id), do: Repo.get!(TruckType, id)

  @doc """
  Creates a truck_type.

  ## Examples

      iex> create_truck_type(%{field: value})
      {:ok, %TruckType{}}

      iex> create_truck_type(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_truck_type(attrs \\ %{}) do
    %TruckType{}
    |> TruckType.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a truck_type.

  ## Examples

      iex> update_truck_type(truck_type, %{field: new_value})
      {:ok, %TruckType{}}

      iex> update_truck_type(truck_type, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_truck_type(%TruckType{} = truck_type, attrs) do
    truck_type
    |> TruckType.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a truck_type.

  ## Examples

      iex> delete_truck_type(truck_type)
      {:ok, %TruckType{}}

      iex> delete_truck_type(truck_type)
      {:error, %Ecto.Changeset{}}

  """
  def delete_truck_type(%TruckType{} = truck_type) do
    Repo.delete(truck_type)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking truck_type changes.

  ## Examples

      iex> change_truck_type(truck_type)
      %Ecto.Changeset{data: %TruckType{}}

  """
  def change_truck_type(%TruckType{} = truck_type, attrs \\ %{}) do
    TruckType.changeset(truck_type, attrs)
  end
end
