defmodule Boken.Fixturer.Lampa do
  use Ecto.Schema
  import Ecto.Changeset

  schema "lampor" do
    field :ljusstyrka, :integer
    field :namn, :string
    field :på, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(lampa, attrs) do
    lampa
    |> cast(attrs, [:namn, :ljusstyrka, :på])
    |> validate_required([:namn, :ljusstyrka, :på])
		|> validate_inclusion(:ljusstyrka, 0..100)
		|> unique_constraint(:namn)
	end
end
