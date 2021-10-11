defmodule Boken.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email])
    |> validate_required([:name])
		|> validate_length(:name, min: 2)
		|> validate_length(:name, max: 100)
		|> validate_format(:email, ~r/@/)
  end
end
