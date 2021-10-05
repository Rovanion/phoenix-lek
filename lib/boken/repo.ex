defmodule Boken.Repo do
  use Ecto.Repo,
    otp_app: :boken,
    adapter: Ecto.Adapters.SQLite3
end
