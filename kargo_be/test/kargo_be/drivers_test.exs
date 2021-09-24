defmodule KargoBe.DriversTest do
  use KargoBe.DataCase

  alias KargoBe.Drivers

  describe "drivers" do
    alias KargoBe.Drivers.Driver

    @valid_attrs %{driver_license: "some driver_license", driver_name: "some driver_name", id_card: "some id_card", phone_number: "some phone_number"}
    @update_attrs %{driver_license: "some updated driver_license", driver_name: "some updated driver_name", id_card: "some updated id_card", phone_number: "some updated phone_number"}
    @invalid_attrs %{driver_license: nil, driver_name: nil, id_card: nil, phone_number: nil}

    def driver_fixture(attrs \\ %{}) do
      {:ok, driver} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Drivers.create_driver()

      driver
    end

    test "list_drivers/0 returns all drivers" do
      driver = driver_fixture()
      assert Drivers.list_drivers() == [driver]
    end

    test "get_driver!/1 returns the driver with given id" do
      driver = driver_fixture()
      assert Drivers.get_driver!(driver.id) == driver
    end

    test "create_driver/1 with valid data creates a driver" do
      assert {:ok, %Driver{} = driver} = Drivers.create_driver(@valid_attrs)
      assert driver.driver_license == "some driver_license"
      assert driver.driver_name == "some driver_name"
      assert driver.id_card == "some id_card"
      assert driver.phone_number == "some phone_number"
    end

    test "create_driver/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Drivers.create_driver(@invalid_attrs)
    end

    test "update_driver/2 with valid data updates the driver" do
      driver = driver_fixture()
      assert {:ok, %Driver{} = driver} = Drivers.update_driver(driver, @update_attrs)
      assert driver.driver_license == "some updated driver_license"
      assert driver.driver_name == "some updated driver_name"
      assert driver.id_card == "some updated id_card"
      assert driver.phone_number == "some updated phone_number"
    end

    test "update_driver/2 with invalid data returns error changeset" do
      driver = driver_fixture()
      assert {:error, %Ecto.Changeset{}} = Drivers.update_driver(driver, @invalid_attrs)
      assert driver == Drivers.get_driver!(driver.id)
    end

    test "delete_driver/1 deletes the driver" do
      driver = driver_fixture()
      assert {:ok, %Driver{}} = Drivers.delete_driver(driver)
      assert_raise Ecto.NoResultsError, fn -> Drivers.get_driver!(driver.id) end
    end

    test "change_driver/1 returns a driver changeset" do
      driver = driver_fixture()
      assert %Ecto.Changeset{} = Drivers.change_driver(driver)
    end
  end
end
