defmodule Pokefight.Repo do
  use Ecto.Repo,
    otp_app: :pokefight,
    adapter: Ecto.Adapters.Postgres
end
