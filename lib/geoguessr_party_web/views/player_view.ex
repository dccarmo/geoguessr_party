defmodule GeoguessrPartyWeb.PlayerView do
  use GeoguessrPartyWeb, :view
  alias GeoguessrPartyWeb.PlayerView

  def render("index.json", %{players: players}) do
    %{data: render_many(players, PlayerView, "player.json")}
  end

  def render("show.json", %{player: player}) do
    %{data: render_one(player, PlayerView, "player.json")}
  end

  def render("player.json", %{player: player}) do
    %{id: player.id,
      geoguessr_id: player.geoguessr_id,
      nick: player.nick}
  end
end
