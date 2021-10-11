defmodule BokenWeb.LampaLive.Index do
  use BokenWeb, :live_view

  alias Boken.Fixturer
  alias Boken.Fixturer.Lampa

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :lampor, list_lampor())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Lampa")
    |> assign(:lampa, Fixturer.get_lampa!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "Ny Lampa")
    |> assign(:lampa, %Lampa{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Alla Lampor")
    |> assign(:lampa, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    lampa = Fixturer.get_lampa!(id)
    {:ok, _} = Fixturer.delete_lampa(lampa)

    {:noreply, assign(socket, :lampor, list_lampor())}
  end

  defp list_lampor do
    Fixturer.list_lampor()
  end
end
