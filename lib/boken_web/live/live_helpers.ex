defmodule BokenWeb.LiveHelpers do
  import Phoenix.LiveView.Helpers

  @doc """
  Renders a component inside the `BokenWeb.ModalComponent` component.

  The rendered modal receives a `:return_to` option to properly update
  the URL when the modal is closed.

  ## Examples

      <%= live_modal BokenWeb.LampaLive.FormComponent,
        id: @lampa.id || :new,
        action: @live_action,
        lampa: @lampa,
        return_to: Routes.lampa_index_path(@socket, :index) %>
  """
  def live_modal(component, opts) do
    path = Keyword.fetch!(opts, :return_to)
    modal_opts = [id: :modal, return_to: path, component: component, opts: opts]
    live_component(BokenWeb.ModalComponent, modal_opts)
  end
end
