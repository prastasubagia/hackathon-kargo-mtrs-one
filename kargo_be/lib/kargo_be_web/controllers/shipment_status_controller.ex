defmodule KargoBeWeb.ShipmentStatusController do
  use KargoBeWeb, :controller

  alias KargoBe.Shipments
  alias KargoBe.Shipments.ShipmentStatus

  action_fallback KargoBeWeb.FallbackController

  def index(conn, _params) do
    shipment_statuses = Shipments.list_shipment_statuses()
    render(conn, "index.json", shipment_statuses: shipment_statuses)
  end

  def create(conn, %{"shipment_status" => shipment_status_params}) do
    with {:ok, %ShipmentStatus{} = shipment_status} <- Shipments.create_shipment_status(shipment_status_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.shipment_status_path(conn, :show, shipment_status))
      |> render("show.json", shipment_status: shipment_status)
    end
  end

  def show(conn, %{"id" => id}) do
    shipment_status = Shipments.get_shipment_status!(id)
    render(conn, "show.json", shipment_status: shipment_status)
  end

  def update(conn, %{"id" => id, "shipment_status" => shipment_status_params}) do
    shipment_status = Shipments.get_shipment_status!(id)

    with {:ok, %ShipmentStatus{} = shipment_status} <- Shipments.update_shipment_status(shipment_status, shipment_status_params) do
      render(conn, "show.json", shipment_status: shipment_status)
    end
  end

  def delete(conn, %{"id" => id}) do
    shipment_status = Shipments.get_shipment_status!(id)

    with {:ok, %ShipmentStatus{}} <- Shipments.delete_shipment_status(shipment_status) do
      send_resp(conn, :no_content, "")
    end
  end
end
