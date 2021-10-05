defmodule BokenWeb.LightLive do
	use BokenWeb, :live_view

	def mount(_params, _session, socket) do
		socket = assign(socket, :brightness, 10)
		IO.inspect(socket)
		{:ok, socket}
	end

	def render(assigns) do
		~H"""
    <h1>Lampstyrka</h1>
		<div class="meter">
		  <span class="bar" style={"width: #{@brightness}%"}>
		    <%= @brightness %>%
		  </span>
		</div>
		<button phx-click="toggle">
		  💡
		</button>
    """
  end

	def handle_event("toggle", _, socket) do
		assign(socket, :brightness, 0)
		{:noreply, socket}
	end

end
