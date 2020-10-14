

defmodule GeoguessrPartyWeb.ApiSpec do
  alias OpenApiSpex.{Info, OpenApi, Paths}
  @behaviour OpenApi

  @impl OpenApi
  def spec do
    %OpenApi{
      info: %Info{
        title: "Geoguessr Party",
        version: "1.0"
      },
      servers: [OpenApiSpex.Server.from_endpoint(GeoguessrPartyWeb.Endpoint)],
      paths: Paths.from_router(GeoguessrPartyWeb.Router)
    }
    |> OpenApiSpex.resolve_schema_modules()
  end
end
