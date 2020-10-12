defmodule GeoguessrPartyWeb.GameController do
  use GeoguessrPartyWeb, :controller

  alias GeoguessrParty.Challenges
  alias GeoguessrParty.Challenges.Game

  action_fallback GeoguessrPartyWeb.FallbackController

  def index(conn, _params) do
    games = Challenges.list_games()
    render(conn, "index.json", games: games)
  end

  def create(conn, %{"game" => game_params}) do
    with {:ok, %Game{} = game} <- Challenges.create_game(game_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.game_path(conn, :show, game))
      |> render("show.json", game: game)
    end
  end

  def show(conn, %{"id" => id}) do
    game = Challenges.get_game!(id)
    render(conn, "show.json", game: game)
  end

  def update(conn, %{"id" => id, "game" => game_params}) do
    game = Challenges.get_game!(id)

    with {:ok, %Game{} = game} <- Challenges.update_game(game, game_params) do
      render(conn, "show.json", game: game)
    end
  end

  def delete(conn, %{"id" => id}) do
    game = Challenges.get_game!(id)

    with {:ok, %Game{}} <- Challenges.delete_game(game) do
      send_resp(conn, :no_content, "")
    end
  end
end
