defmodule KargoBe.ShipmentsTest do
  use KargoBe.DataCase

  alias KargoBe.Shipments

  describe "shipment_statuses" do
    alias KargoBe.Shipments.ShipmentStatus

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def shipment_status_fixture(attrs \\ %{}) do
      {:ok, shipment_status} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Shipments.create_shipment_status()

      shipment_status
    end

    test "list_shipment_statuses/0 returns all shipment_statuses" do
      shipment_status = shipment_status_fixture()
      assert Shipments.list_shipment_statuses() == [shipment_status]
    end

    test "get_shipment_status!/1 returns the shipment_status with given id" do
      shipment_status = shipment_status_fixture()
      assert Shipments.get_shipment_status!(shipment_status.id) == shipment_status
    end

    test "create_shipment_status/1 with valid data creates a shipment_status" do
      assert {:ok, %ShipmentStatus{} = shipment_status} = Shipments.create_shipment_status(@valid_attrs)
      assert shipment_status.name == "some name"
    end

    test "create_shipment_status/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Shipments.create_shipment_status(@invalid_attrs)
    end

    test "update_shipment_status/2 with valid data updates the shipment_status" do
      shipment_status = shipment_status_fixture()
      assert {:ok, %ShipmentStatus{} = shipment_status} = Shipments.update_shipment_status(shipment_status, @update_attrs)
      assert shipment_status.name == "some updated name"
    end

    test "update_shipment_status/2 with invalid data returns error changeset" do
      shipment_status = shipment_status_fixture()
      assert {:error, %Ecto.Changeset{}} = Shipments.update_shipment_status(shipment_status, @invalid_attrs)
      assert shipment_status == Shipments.get_shipment_status!(shipment_status.id)
    end

    test "delete_shipment_status/1 deletes the shipment_status" do
      shipment_status = shipment_status_fixture()
      assert {:ok, %ShipmentStatus{}} = Shipments.delete_shipment_status(shipment_status)
      assert_raise Ecto.NoResultsError, fn -> Shipments.get_shipment_status!(shipment_status.id) end
    end

    test "change_shipment_status/1 returns a shipment_status changeset" do
      shipment_status = shipment_status_fixture()
      assert %Ecto.Changeset{} = Shipments.change_shipment_status(shipment_status)
    end
  end
end
