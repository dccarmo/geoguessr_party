defmodule GeoguessrPartyWeb.GameController do
  use GeoguessrPartyWeb, :controller

  alias GeoguessrParty.Challenges
  alias GeoguessrParty.Challenges.Game
  alias GeoguessrParty.Challenges.Challenge
  alias GeoguessrParty.Challenges.Guess

  action_fallback GeoguessrPartyWeb.FallbackController

  # def index(conn, _params) do
  #   games = Challenges.list_games()
  #   render(conn, "index.json", games: games)
  # end

  def create(conn, %{
        "challenge" => %{"geoguessr_id" => challenge_geoguessr_id},
        "player" => %{"geoguessr_id" => player_geoguessr_id},
        "game" => game_params
      }) do
    challenge = Challenges.get_challenge_by_geoguessr_id!(challenge_geoguessr_id)
    player = Challenges.get_player_by_geoguessr_id(player_geoguessr_id)

    with {:ok, %Game{} = game} <- Challenges.create_game(challenge, game_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.game_path(conn, :show, game.geoguessr_id))
      |> render("show.json", game: game)
    end
  end

  def show(conn, %{"id" => id}) do
    game = Challenges.get_game!(id)
    render(conn, "show.json", game: game)
  end

  # def guess(conn, %{"game_geoguessr_id" => game_geoguessr_id}) do
  #   game = Challenges.get_game!(game_geoguessr_id)

  #   with {:ok, %Guess{} = guess} <- Challenges.create_guess(game)
  #     conn
  #     |> put_status(:created)
  #     |> put_resp_header("location", Routes.guess_path(conn, :show, game))
  #     |> render("show.json", game: game)
  #   end
  # end

  # def update(conn, %{"id" => id, "game" => game_params}) do
  #   game = Challenges.get_game!(id)

  #   with {:ok, %Game{} = game} <- Challenges.update_game(game, game_params) do
  #     render(conn, "show.json", game: game)
  #   end
  # end

  # def delete(conn, %{"id" => id}) do
  #   game = Challenges.get_game!(id)

  #   with {:ok, %Game{}} <- Challenges.delete_game(game) do
  #     send_resp(conn, :no_content, "")
  #   end
  # end
end
