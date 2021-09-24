defmodule KargoBeWeb.ShipmentStatusView do
  use KargoBeWeb, :view
  alias KargoBeWeb.ShipmentStatusView

  def render("index.json", %{shipment_statuses: shipment_statuses}) do
    %{data: render_many(shipment_statuses, ShipmentStatusView, "shipment_status.json")}
  end

  def render("show.json", %{shipment_status: shipment_status}) do
    %{data: render_one(shipment_status, ShipmentStatusView, "shipment_status.json")}
  end

  def render("shipment_status.json", %{shipment_status: shipment_status}) do
    %{id: shipment_status.id,
      name: shipment_status.name}
  end
end
