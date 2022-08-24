# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :rock_school,
  ecto_repos: [RockSchool.Repo]

# Configures the endpoint
config :rock_school, RockSchoolWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: RockSchoolWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: RockSchool.PubSub,
  live_view: [signing_salt: "x32Twt9R"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :rock_school, RockSchool.Mailer, adapter: Swoosh.Adapters.Local

config :rock_school, :phoenix_swagger,
  swagger_files: %{
    "priv/static/swagger.json" => [
      router: RockSchoolWeb.Router,
      endpoint: RockSchoolWeb.Endpoint
    ]
  }

# Swoosh API client is needed for adapters other than SMTP.
config :swoosh, :api_client, false

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.14.0",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason
config :phoenix_swagger, json_library: Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
