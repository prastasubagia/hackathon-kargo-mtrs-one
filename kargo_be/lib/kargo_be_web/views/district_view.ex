defmodule KargoBeWeb.DistrictView do
  use KargoBeWeb, :view
  alias KargoBeWeb.DistrictView

  def render("index.json", %{districts: districts}) do
    %{data: render_many(districts, DistrictView, "district.json")}
  end

  def render("show.json", %{district: district}) do
    %{data: render_one(district, DistrictView, "district.json")}
  end

  def render("district.json", %{district: district}) do
    %{id: district.id,
      name: district.name}
  end
end
