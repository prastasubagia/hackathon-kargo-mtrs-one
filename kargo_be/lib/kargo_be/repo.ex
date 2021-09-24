defmodule KargoBe.Repo do
  use Ecto.Repo,
    otp_app: :kargo_be,
    adapter: Ecto.Adapters.Postgres
end
