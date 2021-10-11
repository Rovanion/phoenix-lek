defmodule Boken.Repo.Migrations.CreateLampor do
  use Ecto.Migration

  def change do
    create table(:lampor) do
      add :namn, :string
      add :ljusstyrka, :integer
      add :på, :boolean, default: false, null: false

      timestamps()
    end
  end
end
