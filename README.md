# Kennitala [![Build Status](https://travis-ci.org/JonGretar/Kennitala.ex.svg?branch=master)](https://travis-ci.org/JonGretar/Kennitala.ex) [![Coverage Status](https://coveralls.io/repos/github/JonGretar/Kennitala.ex/badge.svg?branch=master)](https://coveralls.io/github/JonGretar/Kennitala.ex?branch=master)

Elixir library for validating and handling the Icelandic [Kennitala](https://en.wikipedia.org/wiki/Kennitala) national identity number.


> The kennitala (plural: kennitölur; abbreviated kt.) (English: Identity Number) is a unique national identification number used by the Icelandic government to identify individuals and organisations in Iceland, administered by the Registers Iceland. Kennitölur are issued to Icelandic citizens at birth, and to foreign nationals resident in Iceland upon registration.[1] They are also issued to corporations and institutions.
>
> ...
>
> The system is similar to that employed by some other European countries, but Iceland makes unusually extensive and public use of its kennitölur, with businesses and educational institutions eschewing internal identification numbers in favour of the national system, and its use being mandated in banking transactions. Furthermore, online banking services in Iceland offer a lookup service to check names against numbers. Because of their public nature, kennitölur are not used for authentication. The completeness of the National Register has eliminated the need for the country to conduct a regular census: population statistics can be obtained by simply querying the database.



## Installation

Using [Hex](https://hex.pm), the package can be installed as:

  1. Add kennitala to your list of dependencies in `mix.exs`:

        def deps do
          [{:kennitala, "~> 0.0.1"}]
        end
