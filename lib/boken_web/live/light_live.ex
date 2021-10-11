defmodule BokenWeb.LightLive do
	use BokenWeb, :live_view
	alias Boken.Light

	@impl true
	def mount(_params, _session, socket) do
		{:ok, assign(socket, :light, Light.get_light(1))}
	end

	@impl true
	def render(assigns) do
		~H"""
      <h1>Lampstyrka</h1>
		  <label for="name">Namn:</label>
		  <input phx-blur="namechange" id="name" type="text" value={@light.name}>
		  <div class="meter">
		    <span class={"bar #{@light.on}"} style={"width: #{@light.brightness}%"}>
		      <%= @light.brightness %>%
		    </span>
		  </div>
		  <br/>
		  <button phx-click="decrement">-</button>
		  <button phx-click="toggle">💡</button>
		  <button phx-click="increment">+</button>
    """
  end

	@impl true
	def handle_event("toggle", _, socket) do
		{:ok, light} = Light.update_light(socket.assigns.light, %{on: !socket.assigns.light.on})
		{:noreply, assign(socket, :light, light)}
	end
	@impl true
	def handle_event("increment", _, socket) do
		{:ok, light} = Light.update_light(socket.assigns.light, %{brightness: socket.assigns.light.brightness + 10})
		{:noreply, assign(socket, :light, light)}
	end
	@impl true
	def handle_event("decrement", _, socket) do
		{:ok, light} = Light.update_light(socket.assigns.light, %{brightness: socket.assigns.light.brightness - 10})
		{:noreply, assign(socket, :light, light)}
	end
	@impl true
	def handle_event("namechange", params, socket) do
		{:ok, light} = Light.update_light(socket.assigns.light, %{name: params["value"]})
		{:noreply, assign(socket, :light, light)}
	end
end
