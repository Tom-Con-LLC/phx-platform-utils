defmodule PhxPlatformUtils.MixProject do
  use Mix.Project

  def project do
    [
      app: :phx_platform_utils,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:castore, "~> 1.0.12"},
      {:certifi, "~> 2.14.0"},
      {:ecto_sql, "~> 3.10"},
      {:faker, "~> 0.18"},
      {:gen_rmq, "~> 4.0"},
      {:httpoison, "~> 2.2.3"},
      {:inflex, "~> 2.1.0"},
      {:jason, "~> 1.4.4"},
      {:joi, "~> 0.2.1"},
      {:logger_json, "~> 7.0.0"},
      {:phoenix, "~> 1.7.21"},
      {:phoenix_ecto, "~> 4.6.3"},
      {:redix, "~> 1.5.2"}
    ]
  end
end
