import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :rock_school, RockSchoolWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "VpwXb5TpgGpyNJibZ3RHz5YkRRLKEzEswnAkEY0YfxLLBq7G4zt/COYMg23O3f5B",
  server: false

# In test we don't send emails.
config :rock_school, RockSchool.Mailer,
  adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
