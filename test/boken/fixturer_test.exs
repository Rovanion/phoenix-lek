defmodule Boken.FixturerTest do
  use Boken.DataCase

  alias Boken.Fixturer

  describe "lampor" do
    alias Boken.Fixturer.Lampa

    import Boken.FixturerFixtures

    @invalid_attrs %{ljusstyrka: nil, namn: nil, på: nil}

    test "list_lampor/0 returns all lampor" do
      lampa = lampa_fixture()
      assert Fixturer.list_lampor() == [lampa]
    end

    test "get_lampa!/1 returns the lampa with given id" do
      lampa = lampa_fixture()
      assert Fixturer.get_lampa!(lampa.id) == lampa
    end

    test "create_lampa/1 with valid data creates a lampa" do
      valid_attrs = %{ljusstyrka: 42, namn: "some namn", på: true}

      assert {:ok, %Lampa{} = lampa} = Fixturer.create_lampa(valid_attrs)
      assert lampa.ljusstyrka == 42
      assert lampa.namn == "some namn"
      assert lampa.på == true
    end

    test "create_lampa/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Fixturer.create_lampa(@invalid_attrs)
    end

    test "update_lampa/2 with valid data updates the lampa" do
      lampa = lampa_fixture()
      update_attrs = %{ljusstyrka: 43, namn: "some updated namn", på: false}

      assert {:ok, %Lampa{} = lampa} = Fixturer.update_lampa(lampa, update_attrs)
      assert lampa.ljusstyrka == 43
      assert lampa.namn == "some updated namn"
      assert lampa.på == false
    end

    test "update_lampa/2 with invalid data returns error changeset" do
      lampa = lampa_fixture()
      assert {:error, %Ecto.Changeset{}} = Fixturer.update_lampa(lampa, @invalid_attrs)
      assert lampa == Fixturer.get_lampa!(lampa.id)
    end

    test "delete_lampa/1 deletes the lampa" do
      lampa = lampa_fixture()
      assert {:ok, %Lampa{}} = Fixturer.delete_lampa(lampa)
      assert_raise Ecto.NoResultsError, fn -> Fixturer.get_lampa!(lampa.id) end
    end

    test "change_lampa/1 returns a lampa changeset" do
      lampa = lampa_fixture()
      assert %Ecto.Changeset{} = Fixturer.change_lampa(lampa)
    end
  end
end
