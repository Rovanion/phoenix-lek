defmodule BokenWeb.LampaLive.Show do
  use BokenWeb, :live_view

  alias Boken.Fixturer

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:lampa, Fixturer.get_lampa!(id))}
  end

  defp page_title(:show), do: "Visar Lampa"
  defp page_title(:edit), do: "Redigerar Lampa"

	def handle_event("increment", _, socket) do
		{:noreply, update(socket.lampa, :ljusstyrka, &(&1 + 10))}
	end
	def handle_event("decrement", _, socket) do
		{:noreply, update(socket["lampa"], :ljusstyrka, &(&1 - 10))}
	end
end
