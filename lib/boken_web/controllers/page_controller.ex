defmodule BokenWeb.PageController do
  use BokenWeb, :controller

  def index(conn, _params) do
    conn
		|> render(conn, "index.html")
  end

	def redirect_test(conn, _params) do
		render(conn, "index.html")
	end
end
