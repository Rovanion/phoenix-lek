defmodule Boken.Light do
  use Ecto.Schema
  import Ecto.Changeset
	alias Boken.Light
	alias Boken.Repo

  schema "lights" do
    field :brightness, :integer
    field :name, :string
    field :on, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(light, attrs) do
    light
    |> cast(attrs, [:name, :brightness, :on])
    |> validate_required([:name, :brightness, :on])
    |> unique_constraint(:name)
  end

	def create_light(attrs \\ %{}) do
		%Light{} |> Light.changeset(attrs) |> Repo.insert()
	end

	def get_light(name) do
		Repo.get(Light, name)
	end

	def update_light(%Light{} = light, attrs) do
		light |> Light.changeset(attrs) |> Repo.update()
	end
end
