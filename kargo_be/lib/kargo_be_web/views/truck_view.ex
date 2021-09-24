defmodule KargoBeWeb.TruckView do
  use KargoBeWeb, :view
  alias KargoBeWeb.{TruckView, TruckTypeView}

  def render("index.json", %{trucks: trucks}) do
    %{data: render_many(trucks, TruckView, "truck.json")}
  end

  def render("show.json", %{truck: truck}) do
    %{data: render_one(truck, TruckView, "truck.json")}
  end

  def render("truck.json", %{truck: truck}) do
    %{id: truck.id,
      license_number: truck.license_number,
      license_type: truck.license_type,
      production_year: truck.production_year,
      stnk_path: truck.stnk_path,
      kir_path: truck.kir_path,
      status: truck.status,
      truck_type: render_one(truck.truck_type, TruckTypeView, "truck_type.json")
    }
  end
end
