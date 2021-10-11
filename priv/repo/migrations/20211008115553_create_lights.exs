defmodule Boken.Repo.Migrations.CreateLights do
  use Ecto.Migration

  def change do
    create table(:lights) do
      add :name, :string
      add :brightness, :integer
      add :on, :boolean, default: false, null: false

      timestamps()
    end

    create unique_index(:lights, [:name])
  end
end
