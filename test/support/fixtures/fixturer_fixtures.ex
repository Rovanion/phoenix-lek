defmodule Boken.FixturerFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Boken.Fixturer` context.
  """

  @doc """
  Generate a lampa.
  """
  def lampa_fixture(attrs \\ %{}) do
    {:ok, lampa} =
      attrs
      |> Enum.into(%{
        ljusstyrka: 42,
        namn: "some namn",
        på: true
      })
      |> Boken.Fixturer.create_lampa()

    lampa
  end
end
