defmodule RockSchool.Repo do
  use Ecto.Repo,
    otp_app: :rock_school,
    adapter: Ecto.Adapters.Postgres
end
