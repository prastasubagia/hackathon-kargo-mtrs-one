defmodule KargoBe.TrucksTest do
  use KargoBe.DataCase

  alias KargoBe.Trucks

  describe "trucks" do
    alias KargoBe.Trucks.Truck

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def truck_fixture(attrs \\ %{}) do
      {:ok, truck} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Trucks.create_truck()

      truck
    end

    test "list_trucks/0 returns all trucks" do
      truck = truck_fixture()
      assert Trucks.list_trucks() == [truck]
    end

    test "get_truck!/1 returns the truck with given id" do
      truck = truck_fixture()
      assert Trucks.get_truck!(truck.id) == truck
    end

    test "create_truck/1 with valid data creates a truck" do
      assert {:ok, %Truck{} = truck} = Trucks.create_truck(@valid_attrs)
    end

    test "create_truck/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Trucks.create_truck(@invalid_attrs)
    end

    test "update_truck/2 with valid data updates the truck" do
      truck = truck_fixture()
      assert {:ok, %Truck{} = truck} = Trucks.update_truck(truck, @update_attrs)
    end

    test "update_truck/2 with invalid data returns error changeset" do
      truck = truck_fixture()
      assert {:error, %Ecto.Changeset{}} = Trucks.update_truck(truck, @invalid_attrs)
      assert truck == Trucks.get_truck!(truck.id)
    end

    test "delete_truck/1 deletes the truck" do
      truck = truck_fixture()
      assert {:ok, %Truck{}} = Trucks.delete_truck(truck)
      assert_raise Ecto.NoResultsError, fn -> Trucks.get_truck!(truck.id) end
    end

    test "change_truck/1 returns a truck changeset" do
      truck = truck_fixture()
      assert %Ecto.Changeset{} = Trucks.change_truck(truck)
    end
  end
end
