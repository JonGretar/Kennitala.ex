defmodule Kennitala.Mixfile do
  use Mix.Project

  def project do
    [
      app: :kennitala,
      version: "1.0.0",
      elixir: "~> 1.1",
      description: description,
      package: package,
      name: "Kennitala",
      source_url: "https://github.com/JonGretar/Kennitala.ex",
      homepage_url: "https://github.com/JonGretar/Kennitala.ex",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps,
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: ["coveralls": :test, "coveralls.detail": :test, "coveralls.post": :test, "coveralls.html": :test]
    ]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [
      {:excoveralls, "~> 0.5", only: :test},
      {:ex_doc, "~> 0.11", only: :docs},
      {:ex_doc_dash, "~> 0.3", only: :docs}
    ]
  end

  defp description do
    """
    Elixir library for validating and handling the Icelandic Kennitala identity number.
    """
  end

  defp package do
    [
      maintainers: ["Jón Grétar Borgþórsson"],
      licenses: ["MIT"],
      links: %{
        "GitHub": "https://github.com/JonGretar/Kennitala.ex",
        "Kennitala on Wikipedia": "https://en.wikipedia.org/wiki/Kennitala"
      }
    ]
  end
end
