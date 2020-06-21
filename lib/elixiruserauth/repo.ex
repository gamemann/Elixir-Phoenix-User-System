defmodule Elixiruserauth.Repo do
  use Ecto.Repo,
    otp_app: :elixiruserauth,
    adapter: Ecto.Adapters.Postgres
end
