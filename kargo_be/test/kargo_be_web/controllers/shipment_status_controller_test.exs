defmodule KargoBeWeb.ShipmentStatusControllerTest do
  use KargoBeWeb.ConnCase

  alias KargoBe.Shipments
  alias KargoBe.Shipments.ShipmentStatus

  @create_attrs %{
    name: "some name"
  }
  @update_attrs %{
    name: "some updated name"
  }
  @invalid_attrs %{name: nil}

  def fixture(:shipment_status) do
    {:ok, shipment_status} = Shipments.create_shipment_status(@create_attrs)
    shipment_status
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all shipment_statuses", %{conn: conn} do
      conn = get(conn, Routes.shipment_status_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create shipment_status" do
    test "renders shipment_status when data is valid", %{conn: conn} do
      conn = post(conn, Routes.shipment_status_path(conn, :create), shipment_status: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.shipment_status_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.shipment_status_path(conn, :create), shipment_status: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update shipment_status" do
    setup [:create_shipment_status]

    test "renders shipment_status when data is valid", %{conn: conn, shipment_status: %ShipmentStatus{id: id} = shipment_status} do
      conn = put(conn, Routes.shipment_status_path(conn, :update, shipment_status), shipment_status: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.shipment_status_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, shipment_status: shipment_status} do
      conn = put(conn, Routes.shipment_status_path(conn, :update, shipment_status), shipment_status: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete shipment_status" do
    setup [:create_shipment_status]

    test "deletes chosen shipment_status", %{conn: conn, shipment_status: shipment_status} do
      conn = delete(conn, Routes.shipment_status_path(conn, :delete, shipment_status))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.shipment_status_path(conn, :show, shipment_status))
      end
    end
  end

  defp create_shipment_status(_) do
    shipment_status = fixture(:shipment_status)
    %{shipment_status: shipment_status}
  end
end
