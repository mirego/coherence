defmodule Coherence.Mixfile do
  use Mix.Project

  @version "0.7.0"

  def project do
    [
      app: :coherence,
      version: @version,
      elixir: "~> 1.13",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix] ++ Mix.compilers(),
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      docs: [extras: ["README.md"], main: "Coherence"],
      deps: deps(),
      package: package(),
      dialyzer: [plt_add_apps: [:mix]],
      name: "Coherence",
      description: """
      A full featured, configurable authentication and user management system for Phoenix.
      """
    ]
  end

  # Configuration for the OTP application
  def application do
    [
      mod: {Coherence, []},
      extra_applications: [
        :logger,
        :ecto,
        :elixir_uuid,
        :phoenix_swoosh,
        :tzdata,
        :plug,
        :phoenix,
        :phoenix_html,
        :ecto_sql,
        :timex,
        :crypto,
        :eex,
        :plug
      ]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:ecto, "~> 3.9", override: true},
      {:ecto_sql, "~> 3.4"},
      {:bcrypt_elixir, "~> 3.0"},
      {:phoenix, "~> 1.3"},
      {:phoenix_html, "~> 3.0"},
      {:gettext, "~> 0.14"},
      {:elixir_uuid, "~> 1.2"},
      {:phoenix_swoosh, "~> 1.0"},
      {:timex, "~> 3.6"},
      {:floki, "~> 0.19", only: :test},
      {:ex_doc, "~> 0.24.0", only: :dev},
      {:earmark, "~> 1.2", only: :dev, override: true},
      {:postgrex, ">= 0.0.0", only: :test},
      {:dialyxir, "~> 1.1", only: [:dev], runtime: false},
      {:credo, "~> 1.5", only: [:dev, :test]},
      {:plug, "~> 1.11"},
      {:jason, "~> 1.0"},
      {:ssl_verify_fun, "~> 1.1.6", manager: :rebar3, override: true}
    ]
  end

  defp package do
    [
      maintainers: ["Stephen Pallen"],
      licenses: ["MIT"],
      links: %{"Github" => "https://github.com/smpallen99/coherence"},
      files: ~w(lib priv README.md mix.exs LICENSE)
    ]
  end
end
