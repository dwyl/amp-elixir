defmodule Amp.Mixfile do
  use Mix.Project

  def project do
    [app: :amp,
     version: "0.1.0",
     elixir: "~> 1.4",
     deps: deps(),
     elixirc_paths: elixirc_paths(Mix.env),
     description: description(),
     package: package(),
     test_coverage: [tool: ExCoveralls],
     preferred_cli_env: ["coveralls": :test,
                         "coveralls.detail": :test,
                         "coveralls.post": :test,
                         "coveralls.html": :test]]
  end

  def application do
    [extra_applications: [:logger]]
  end

  defp deps do
    [{:excoveralls, "~> 0.6.2"},
     {:ex_doc, "~> 0.11", only: :dev},
     {:dogma, "~> 0.1"},
     {:earmark, "~> 1.2"}]
  end

  defp description do
    """
    Amp is an Elixir Markdown to AMP HTML converter.
    For more information on AMP HTML see:
    https://www.ampproject.org/learn/overview/
    """
  end

  defp package do
    [
      files: [
        "lib", "mix.exs", "README.md"
      ],
      maintainers: [ "Sam Houston <sam@dwyl.io>" ],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/dwyl/amp-elixir",
      }
    ]
  end

  defp elixirc_paths(:test), do: [ "lib", "test/support" ]
  defp elixirc_paths(_), do: [ "lib" ]
end
