defmodule BokenWeb.LampaLive.FormComponent do
  use BokenWeb, :live_component

  alias Boken.Fixturer

  @impl true
  def update(%{lampa: lampa} = assigns, socket) do
    changeset = Fixturer.change_lampa(lampa)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"lampa" => lampa_params}, socket) do
    changeset =
      socket.assigns.lampa
      |> Fixturer.change_lampa(lampa_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"lampa" => lampa_params}, socket) do
    save_lampa(socket, socket.assigns.action, lampa_params)
  end

  defp save_lampa(socket, :edit, lampa_params) do
    case Fixturer.update_lampa(socket.assigns.lampa, lampa_params) do
      {:ok, _lampa} ->
        {:noreply,
         socket
         |> put_flash(:info, "Lampa updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_lampa(socket, :new, lampa_params) do
    case Fixturer.create_lampa(lampa_params) do
      {:ok, _lampa} ->
        {:noreply,
         socket
         |> put_flash(:info, "Lampa created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
