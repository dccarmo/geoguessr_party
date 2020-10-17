defmodule GeoguessrPartyWeb.ChallengeController do
  use GeoguessrPartyWeb, :controller

  alias GeoguessrParty.Challenges
  alias GeoguessrParty.Challenges.Challenge

  action_fallback GeoguessrPartyWeb.FallbackController

  # @spec index(Plug.Conn.t(), any) :: Plug.Conn.t()
  # def index(conn, _params) do
  #   challenges = Challenges.list_challenges()
  #   render(conn, "index.json", challenges: challenges)
  # end

  def create(conn, %{"challenge" => challenge_params}) do
    with {:ok, %Challenge{} = challenge} <- Challenges.create_challenge(challenge_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.challenge_path(conn, :show, challenge.geoguessr_id))
      |> render("show.json", challenge: challenge)
    end
  end

  def show(conn, %{"geoguessr_id" => geoguessr_id}) do
    challenge = Challenges.get_challenge_by_geoguessr_id!(geoguessr_id)
    render(conn, "show.json", challenge: challenge)
  end

  # def update(conn, %{"id" => id, "challenge" => challenge_params}) do
  #   challenge = Challenges.get_challenge!(id)

  #   with {:ok, %Challenge{} = challenge} <- Challenges.update_challenge(challenge, challenge_params) do
  #     render(conn, "show.json", challenge: challenge)
  #   end
  # end

  def delete(conn, %{"geoguessr_id" => geoguessr_id}) do
    challenge = Challenges.get_challenge_by_geoguessr_id!(geoguessr_id)

    with {:ok, %Challenge{}} <- Challenges.delete_challenge(challenge) do
      send_resp(conn, :no_content, "")
    end
  end
end
