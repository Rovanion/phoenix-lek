defmodule Boken.Fixturer do
  @moduledoc """
  The Fixturer context.
  """

  import Ecto.Query, warn: false
  alias Boken.Repo

  alias Boken.Fixturer.Lampa

  @doc """
  Returns the list of lampor.

  ## Examples

      iex> list_lampor()
      [%Lampa{}, ...]

  """
  def list_lampor do
    Repo.all(Lampa)
  end

  @doc """
  Gets a single lampa.

  Raises `Ecto.NoResultsError` if the Lampa does not exist.

  ## Examples

      iex> get_lampa!(123)
      %Lampa{}

      iex> get_lampa!(456)
      ** (Ecto.NoResultsError)

  """
  def get_lampa!(id), do: Repo.get!(Lampa, id)

  @doc """
  Creates a lampa.

  ## Examples

      iex> create_lampa(%{field: value})
      {:ok, %Lampa{}}

      iex> create_lampa(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_lampa(attrs \\ %{}) do
    %Lampa{}
    |> Lampa.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a lampa.

  ## Examples

      iex> update_lampa(lampa, %{field: new_value})
      {:ok, %Lampa{}}

      iex> update_lampa(lampa, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_lampa(%Lampa{} = lampa, attrs) do
    lampa
    |> Lampa.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a lampa.

  ## Examples

      iex> delete_lampa(lampa)
      {:ok, %Lampa{}}

      iex> delete_lampa(lampa)
      {:error, %Ecto.Changeset{}}

  """
  def delete_lampa(%Lampa{} = lampa) do
    Repo.delete(lampa)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking lampa changes.

  ## Examples

      iex> change_lampa(lampa)
      %Ecto.Changeset{data: %Lampa{}}

  """
  def change_lampa(%Lampa{} = lampa, attrs \\ %{}) do
    Lampa.changeset(lampa, attrs)
  end
end
