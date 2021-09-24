defmodule KargoBeWeb.DriverControllerTest do
  use KargoBeWeb.ConnCase

  alias KargoBe.Drivers
  alias KargoBe.Drivers.Driver

  @create_attrs %{
    driver_license: "some driver_license",
    driver_name: "some driver_name",
    id_card: "some id_card",
    phone_number: "some phone_number"
  }
  @update_attrs %{
    driver_license: "some updated driver_license",
    driver_name: "some updated driver_name",
    id_card: "some updated id_card",
    phone_number: "some updated phone_number"
  }
  @invalid_attrs %{driver_license: nil, driver_name: nil, id_card: nil, phone_number: nil}

  def fixture(:driver) do
    {:ok, driver} = Drivers.create_driver(@create_attrs)
    driver
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all drivers", %{conn: conn} do
      conn = get(conn, Routes.driver_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create driver" do
    test "renders driver when data is valid", %{conn: conn} do
      conn = post(conn, Routes.driver_path(conn, :create), driver: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.driver_path(conn, :show, id))

      assert %{
               "id" => id,
               "driver_license" => "some driver_license",
               "driver_name" => "some driver_name",
               "id_card" => "some id_card",
               "phone_number" => "some phone_number"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.driver_path(conn, :create), driver: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update driver" do
    setup [:create_driver]

    test "renders driver when data is valid", %{conn: conn, driver: %Driver{id: id} = driver} do
      conn = put(conn, Routes.driver_path(conn, :update, driver), driver: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.driver_path(conn, :show, id))

      assert %{
               "id" => id,
               "driver_license" => "some updated driver_license",
               "driver_name" => "some updated driver_name",
               "id_card" => "some updated id_card",
               "phone_number" => "some updated phone_number"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, driver: driver} do
      conn = put(conn, Routes.driver_path(conn, :update, driver), driver: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete driver" do
    setup [:create_driver]

    test "deletes chosen driver", %{conn: conn, driver: driver} do
      conn = delete(conn, Routes.driver_path(conn, :delete, driver))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.driver_path(conn, :show, driver))
      end
    end
  end

  defp create_driver(_) do
    driver = fixture(:driver)
    %{driver: driver}
  end
end
