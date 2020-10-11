defmodule GeoguessrParty.GameTest do
  use GeoguessrParty.DataCase

  alias GeoguessrParty.Game

  describe "parties" do
    alias GeoguessrParty.Game.Party

    @valid_attrs %{geoguessr_id: "some geoguessr_id"}
    @update_attrs %{geoguessr_id: "some updated geoguessr_id"}
    @invalid_attrs %{geoguessr_id: nil}

    def party_fixture(attrs \\ %{}) do
      {:ok, party} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Game.create_party()

      party
    end

    test "list_parties/0 returns all parties" do
      party = party_fixture()
      assert Game.list_parties() == [party]
    end

    test "get_party!/1 returns the party with given id" do
      party = party_fixture()
      assert Game.get_party!(party.id) == party
    end

    test "create_party/1 with valid data creates a party" do
      assert {:ok, %Party{} = party} = Game.create_party(@valid_attrs)
      assert party.geoguessr_id == "some geoguessr_id"
    end

    test "create_party/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Game.create_party(@invalid_attrs)
    end

    test "update_party/2 with valid data updates the party" do
      party = party_fixture()
      assert {:ok, %Party{} = party} = Game.update_party(party, @update_attrs)
      assert party.geoguessr_id == "some updated geoguessr_id"
    end

    test "update_party/2 with invalid data returns error changeset" do
      party = party_fixture()
      assert {:error, %Ecto.Changeset{}} = Game.update_party(party, @invalid_attrs)
      assert party == Game.get_party!(party.id)
    end

    test "delete_party/1 deletes the party" do
      party = party_fixture()
      assert {:ok, %Party{}} = Game.delete_party(party)
      assert_raise Ecto.NoResultsError, fn -> Game.get_party!(party.id) end
    end

    test "change_party/1 returns a party changeset" do
      party = party_fixture()
      assert %Ecto.Changeset{} = Game.change_party(party)
    end
  end
end
