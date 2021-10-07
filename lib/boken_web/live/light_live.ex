defmodule BokenWeb.LightLive do
	use BokenWeb, :live_view

	def mount(_params, _session, socket) do
		socket = assign(socket, :brightness, 10)
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
		<button phx-click="decrement">-</button>
		<button phx-click="toggle">💡</button>
		<button phx-click="increment">+</button>
    """
  end
	def handle_event("toggle", _, %{assigns: %{last_brightness: last_brightness}}=socket) do
		socket = %{socket | assigns: Map.delete(socket.assigns, :last_brightness)}
		socket = assign(socket, :brightness, last_brightness)
		{:noreply, socket}
	end
	def handle_event("toggle", _, socket) do
		socket = assign(socket, :last_brightness, socket.assigns.brightness)
		socket = assign(socket, :brightness, 0)
		{:noreply, socket}
	end
	def handle_event("increment", _, socket) do
		{:noreply, update(socket, :brightness, &(&1 + 10))}
	end
	def handle_event("decrement", _, socket) do
		{:noreply, update(socket, :brightness, &(&1 - 10))}
	end
end
