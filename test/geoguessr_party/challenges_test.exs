defmodule GeoguessrParty.ChallengesTest do
  use GeoguessrParty.DataCase

  alias GeoguessrParty.Challenges

  describe "challenges" do
    alias GeoguessrParty.Challenges.Challenge

    @valid_attrs %{geoguessr_id: "some geoguessr_id"}
    @update_attrs %{geoguessr_id: "some updated geoguessr_id"}
    @invalid_attrs %{geoguessr_id: nil}

    def challenge_fixture(attrs \\ %{}) do
      {:ok, challenge} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Challenges.create_challenge()

      challenge
    end

    test "list_challenges/0 returns all challenges" do
      challenge = challenge_fixture()
      assert Challenges.list_challenges() == [challenge]
    end

    test "get_challenge!/1 returns the challenge with given id" do
      challenge = challenge_fixture()
      assert Challenges.get_challenge!(challenge.id) == challenge
    end

    test "create_challenge/1 with valid data creates a challenge" do
      assert {:ok, %Challenge{} = challenge} = Challenges.create_challenge(@valid_attrs)
      assert challenge.geoguessr_id == "some geoguessr_id"
    end

    test "create_challenge/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Challenges.create_challenge(@invalid_attrs)
    end

    test "update_challenge/2 with valid data updates the challenge" do
      challenge = challenge_fixture()
      assert {:ok, %Challenge{} = challenge} = Challenges.update_challenge(challenge, @update_attrs)
      assert challenge.geoguessr_id == "some updated geoguessr_id"
    end

    test "update_challenge/2 with invalid data returns error changeset" do
      challenge = challenge_fixture()
      assert {:error, %Ecto.Changeset{}} = Challenges.update_challenge(challenge, @invalid_attrs)
      assert challenge == Challenges.get_challenge!(challenge.id)
    end

    test "delete_challenge/1 deletes the challenge" do
      challenge = challenge_fixture()
      assert {:ok, %Challenge{}} = Challenges.delete_challenge(challenge)
      assert_raise Ecto.NoResultsError, fn -> Challenges.get_challenge!(challenge.id) end
    end

    test "change_challenge/1 returns a challenge changeset" do
      challenge = challenge_fixture()
      assert %Ecto.Changeset{} = Challenges.change_challenge(challenge)
    end
  end

  describe "games" do
    alias GeoguessrParty.Challenges.Game

    @valid_attrs %{geoguessr_id: "some geoguessr_id"}
    @update_attrs %{geoguessr_id: "some updated geoguessr_id"}
    @invalid_attrs %{geoguessr_id: nil}

    def game_fixture(attrs \\ %{}) do
      {:ok, game} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Challenges.create_game()

      game
    end

    test "list_games/0 returns all games" do
      game = game_fixture()
      assert Challenges.list_games() == [game]
    end

    test "get_game!/1 returns the game with given id" do
      game = game_fixture()
      assert Challenges.get_game!(game.id) == game
    end

    test "create_game/1 with valid data creates a game" do
      assert {:ok, %Game{} = game} = Challenges.create_game(@valid_attrs)
      assert game.geoguessr_id == "some geoguessr_id"
    end

    test "create_game/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Challenges.create_game(@invalid_attrs)
    end

    test "update_game/2 with valid data updates the game" do
      game = game_fixture()
      assert {:ok, %Game{} = game} = Challenges.update_game(game, @update_attrs)
      assert game.geoguessr_id == "some updated geoguessr_id"
    end

    test "update_game/2 with invalid data returns error changeset" do
      game = game_fixture()
      assert {:error, %Ecto.Changeset{}} = Challenges.update_game(game, @invalid_attrs)
      assert game == Challenges.get_game!(game.id)
    end

    test "delete_game/1 deletes the game" do
      game = game_fixture()
      assert {:ok, %Game{}} = Challenges.delete_game(game)
      assert_raise Ecto.NoResultsError, fn -> Challenges.get_game!(game.id) end
    end

    test "change_game/1 returns a game changeset" do
      game = game_fixture()
      assert %Ecto.Changeset{} = Challenges.change_game(game)
    end
  end
end
