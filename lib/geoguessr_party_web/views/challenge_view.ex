defmodule GeoguessrPartyWeb.ChallengeView do
  use GeoguessrPartyWeb, :view
  alias GeoguessrPartyWeb.ChallengeView

  def render("index.json", %{challenges: challenges}) do
    %{data: render_many(challenges, ChallengeView, "challenge.json")}
  end

  def render("show.json", %{challenge: challenge}) do
    %{data: render_one(challenge, ChallengeView, "challenge.json")}
  end

  def render("challenge.json", %{challenge: challenge}) do
    %{id: challenge.id,
      geoguessr_id: challenge.geoguessr_id}
  end
end
