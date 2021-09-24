defmodule KargoBeWeb.TruckTypeController do
  use KargoBeWeb, :controller

  alias KargoBe.Trucks
  alias KargoBe.Trucks.TruckType

  action_fallback KargoBeWeb.FallbackController

  def index(conn, _params) do
    truck_types = Trucks.list_truck_types()
    render(conn, "index.json", truck_types: truck_types)
  end

  def create(conn, %{"truck_type" => truck_type_params}) do
    with {:ok, %TruckType{} = truck_type} <- Trucks.create_truck_type(truck_type_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.truck_type_path(conn, :show, truck_type))
      |> render("show.json", truck_type: truck_type)
    end
  end

  def show(conn, %{"id" => id}) do
    truck_type = Trucks.get_truck_type!(id)
    render(conn, "show.json", truck_type: truck_type)
  end

  def update(conn, %{"id" => id, "truck_type" => truck_type_params}) do
    truck_type = Trucks.get_truck_type!(id)

    with {:ok, %TruckType{} = truck_type} <- Trucks.update_truck_type(truck_type, truck_type_params) do
      render(conn, "show.json", truck_type: truck_type)
    end
  end

  def delete(conn, %{"id" => id}) do
    truck_type = Trucks.get_truck_type!(id)

    with {:ok, %TruckType{}} <- Trucks.delete_truck_type(truck_type) do
      send_resp(conn, :no_content, "")
    end
  end
end
