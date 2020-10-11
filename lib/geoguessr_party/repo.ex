defmodule GeoguessrParty.Repo do
  use Ecto.Repo,
    otp_app: :geoguessr_party,
    adapter: Ecto.Adapters.Postgres
end
