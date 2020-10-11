defmodule GeoguessrPartyWeb.PageController do
  use GeoguessrPartyWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
