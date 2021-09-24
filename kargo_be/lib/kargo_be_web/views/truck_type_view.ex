defmodule KargoBeWeb.TruckTypeView do
  use KargoBeWeb, :view
  alias KargoBeWeb.TruckTypeView

  def render("index.json", %{truck_types: truck_types}) do
    %{data: render_many(truck_types, TruckTypeView, "truck_type.json")}
  end

  def render("show.json", %{truck_type: truck_type}) do
    %{data: render_one(truck_type, TruckTypeView, "truck_type.json")}
  end

  def render("truck_type.json", %{truck_type: truck_type}) do
    %{id: truck_type.id,
      name: truck_type.name}
  end
end
