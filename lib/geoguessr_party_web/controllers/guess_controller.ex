defmodule GeoguessrPartyWeb.GuessController do
  use GeoguessrPartyWeb, :controller

  alias GeoguessrParty.Challenges
  alias GeoguessrParty.Challenges.Guess

  action_fallback GeoguessrPartyWeb.FallbackController

  # def index(conn, _params) do
  #   guesses = Challenges.list_guesses()
  #   render(conn, "index.json", guesses: guesses)
  # end

  def create(conn, %{"game_geoguessr_id" => game_geoguessr_id, "guess" => guess_params}) do
    game = Challenges.get_game_by_geoguessr_id!(game_geoguessr_id)

    with {:ok, %Guess{} = guess} <- Challenges.create_guess(game, guess_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.guess_path(conn, :show, guess))
      |> render("show.json", guess: guess)
    end
  end

  def show(conn, %{"id" => id}) do
    guess = Challenges.get_guess!(id)
    render(conn, "show.json", guess: guess)
  end

  # def update(conn, %{"id" => id, "guess" => guess_params}) do
  #   guess = Challenges.get_guess!(id)

  #   with {:ok, %Guess{} = guess} <- Challenges.update_guess(guess, guess_params) do
  #     render(conn, "show.json", guess: guess)
  #   end
  # end

  # def delete(conn, %{"id" => id}) do
  #   guess = Challenges.get_guess!(id)

  #   with {:ok, %Guess{}} <- Challenges.delete_guess(guess) do
  #     send_resp(conn, :no_content, "")
  #   end
  # end
end
