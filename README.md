# Kennitala [![Build Status](https://travis-ci.org/JonGretar/Kennitala.ex.svg?branch=master)](https://travis-ci.org/JonGretar/Kennitala.ex) [![Coverage Status](https://coveralls.io/repos/github/JonGretar/Kennitala.ex/badge.svg?branch=master)](https://coveralls.io/github/JonGretar/Kennitala.ex?branch=master)

 * [Hex Package](https://hex.pm/packages/kennitala)
 * [Hex Docs](https://hexdocs.pm/kennitala/api-reference.html)

Elixir library for validating and handling the Icelandic [Kennitala](https://en.wikipedia.org/wiki/Kennitala) national identity number.

Kennitala are 10 digit numbers.

 * 6 digits designate the birthday of a person in a DDMMYY manner. If a Kennitala holder is a corporate entity
 then 4 is added to the first digit.
 * 2 random digits.
 * 1 verification digit.
 * 1 digit representing the century. 9 for 1900, 0 for 2000.

It's common to represent the Kennitala with a hyphen after the first 6 digits (ie. 111111-1119) and it is supported by this library.


## Wikipedia Description

> The kennitala (plural: kennitölur; abbreviated kt.) (English: Identity Number) is a unique national identification number used by the Icelandic government to identify individuals and organisations in Iceland, administered by the Registers Iceland. Kennitölur are issued to Icelandic citizens at birth, and to foreign nationals resident in Iceland upon registration. They are also issued to corporations and institutions.
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


## Usage

    iex> Kennitala.valid?("1111111119")
    true

    iex> Kennitala.get_birthdate("0102031129")
    {1903, 2, 1}

    iex> Kennitala.type("111111-1119")
    :individual
