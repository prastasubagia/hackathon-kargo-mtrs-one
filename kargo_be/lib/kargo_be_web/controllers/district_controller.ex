defmodule KargoBeWeb.DistrictController do
  use KargoBeWeb, :controller

  alias KargoBe.Locations
  alias KargoBe.Locations.District

  action_fallback KargoBeWeb.FallbackController

  def index(conn, _params) do
    districts = Locations.list_districts()
    render(conn, "index.json", districts: districts)
  end

  def create(conn, %{"district" => district_params}) do
    with {:ok, %District{} = district} <- Locations.create_district(district_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.district_path(conn, :show, district))
      |> render("show.json", district: district)
    end
  end

  def show(conn, %{"id" => id}) do
    district = Locations.get_district!(id)
    render(conn, "show.json", district: district)
  end

  def update(conn, %{"id" => id, "district" => district_params}) do
    district = Locations.get_district!(id)

    with {:ok, %District{} = district} <- Locations.update_district(district, district_params) do
      render(conn, "show.json", district: district)
    end
  end

  def delete(conn, %{"id" => id}) do
    district = Locations.get_district!(id)

    with {:ok, %District{}} <- Locations.delete_district(district) do
      send_resp(conn, :no_content, "")
    end
  end
end
