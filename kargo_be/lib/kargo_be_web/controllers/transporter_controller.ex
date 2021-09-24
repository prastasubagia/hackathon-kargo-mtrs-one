defmodule KargoBeWeb.TransporterController do
  use KargoBeWeb, :controller

  alias KargoBe.UserGroups
  alias KargoBe.UserGroups.Transporter

  action_fallback KargoBeWeb.FallbackController

  def index(conn, _params) do
    transporters = UserGroups.list_transporters()
    render(conn, "index.json", transporters: transporters)
  end

  def create(conn, %{"transporter" => transporter_params}) do
    with {:ok, %Transporter{} = transporter} <- UserGroups.create_transporter(transporter_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.transporter_path(conn, :show, transporter))
      |> render("show.json", transporter: transporter)
    end
  end

  def show(conn, %{"id" => id}) do
    transporter = UserGroups.get_transporter!(id)
    render(conn, "show.json", transporter: transporter)
  end

  def update(conn, %{"id" => id, "transporter" => transporter_params}) do
    transporter = UserGroups.get_transporter!(id)

    with {:ok, %Transporter{} = transporter} <- UserGroups.update_transporter(transporter, transporter_params) do
      render(conn, "show.json", transporter: transporter)
    end
  end

  def delete(conn, %{"id" => id}) do
    transporter = UserGroups.get_transporter!(id)

    with {:ok, %Transporter{}} <- UserGroups.delete_transporter(transporter) do
      send_resp(conn, :no_content, "")
    end
  end
end
