defmodule GeoguessrPartyWeb.PartyView do
  use GeoguessrPartyWeb, :view
  alias GeoguessrPartyWeb.PartyView

  def render("index.json", %{parties: parties}) do
    %{data: render_many(parties, PartyView, "party.json")}
  end

  def render("show.json", %{party: party}) do
    %{data: render_one(party, PartyView, "party.json")}
  end

  def render("party.json", %{party: party}) do
    %{id: party.id,
      geoguessr_id: party.geoguessr_id}
  end
end
