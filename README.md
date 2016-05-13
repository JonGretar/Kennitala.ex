# Kennitala [![Build Status](https://travis-ci.org/JonGretar/Kennitala.ex.svg?branch=master)](https://travis-ci.org/JonGretar/Kennitala.ex) [![Coverage Status](https://coveralls.io/repos/github/JonGretar/Kennitala.ex/badge.svg?branch=master)](https://coveralls.io/github/JonGretar/Kennitala.ex?branch=master)

Elixir library for validating and handling the Icelandic Kennitala identity number.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add kennitala to your list of dependencies in `mix.exs`:

        def deps do
          [{:kennitala, "~> 0.0.1"}]
        end

  2. Ensure kennitala is started before your application:

        def application do
          [applications: [:kennitala]]
        end
