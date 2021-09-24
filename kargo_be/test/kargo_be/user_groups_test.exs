defmodule KargoBe.UserGroupsTest do
  use KargoBe.DataCase

  alias KargoBe.UserGroups

  describe "transporters" do
    alias KargoBe.UserGroups.Transporter

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def transporter_fixture(attrs \\ %{}) do
      {:ok, transporter} =
        attrs
        |> Enum.into(@valid_attrs)
        |> UserGroups.create_transporter()

      transporter
    end

    test "list_transporters/0 returns all transporters" do
      transporter = transporter_fixture()
      assert UserGroups.list_transporters() == [transporter]
    end

    test "get_transporter!/1 returns the transporter with given id" do
      transporter = transporter_fixture()
      assert UserGroups.get_transporter!(transporter.id) == transporter
    end

    test "create_transporter/1 with valid data creates a transporter" do
      assert {:ok, %Transporter{} = transporter} = UserGroups.create_transporter(@valid_attrs)
      assert transporter.name == "some name"
    end

    test "create_transporter/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = UserGroups.create_transporter(@invalid_attrs)
    end

    test "update_transporter/2 with valid data updates the transporter" do
      transporter = transporter_fixture()
      assert {:ok, %Transporter{} = transporter} = UserGroups.update_transporter(transporter, @update_attrs)
      assert transporter.name == "some updated name"
    end

    test "update_transporter/2 with invalid data returns error changeset" do
      transporter = transporter_fixture()
      assert {:error, %Ecto.Changeset{}} = UserGroups.update_transporter(transporter, @invalid_attrs)
      assert transporter == UserGroups.get_transporter!(transporter.id)
    end

    test "delete_transporter/1 deletes the transporter" do
      transporter = transporter_fixture()
      assert {:ok, %Transporter{}} = UserGroups.delete_transporter(transporter)
      assert_raise Ecto.NoResultsError, fn -> UserGroups.get_transporter!(transporter.id) end
    end

    test "change_transporter/1 returns a transporter changeset" do
      transporter = transporter_fixture()
      assert %Ecto.Changeset{} = UserGroups.change_transporter(transporter)
    end
  end
end
