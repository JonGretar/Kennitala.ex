defmodule Kennitala do
  @doc ~S"""
  Elixir library for validating and handling the Icelandic [Kennitala](https://en.wikipedia.org/wiki/Kennitala)
  national identity number.

  Kennitala are 10 digit numbers.

   * 6 digits designate the birthday of a person in a DDMMYY manner. If a Kennitala holder is a corporate entity
   then 4 is added to the first digit.
   * 2 random digits.
   * 1 verification digit.
   * 1 digit representing the century. 9 for 1900, 0 for 2000.

  It's common to represent the Kennitala with a hyphen after the first 6 digits (ie. 111111-1119) and it is supported
  by this library.
  """

  @magic [3, 2, 7, 6, 5, 4, 3, 2];

  @typedoc """
  Tuple with {Year, Month, Day}
  """
  @type date_tuple :: {pos_integer(), pos_integer(), pos_integer()}

  @doc ~S"""
  Check legality of kennitala

      iex> Kennitala.valid?("1111111119")
      true
  """
  @spec valid?(String.t) :: boolean()
  def valid?(kennitala) when is_binary(kennitala), do: kennitala |> validity
  def valid?(_), do: false

  @doc ~S"""
  Get the birthday from kennitala

      iex> Kennitala.get_birthdate("0102031129")
      {1903, 2, 1}
  """
  @spec get_birthdate(String.t) :: date_tuple
  def get_birthdate(kennitala) when is_binary(kennitala) do
    case tokenize(kennitala) do
      [d1,d2,m1,m2,y1,y2,_,_,_,c] when d1 >= 4 ->
        {calc_date(y1, y2, c), calc_date(m1, m2), calc_date(d1 - 4, d2)}
      [d1,d2,m1,m2,y1,y2,_,_,_,c] ->
        {calc_date(y1, y2, c), calc_date(m1, m2), calc_date(d1, d2)}
    end
  end
  def get_birthdate(kennitala), do: :invalid


  @doc ~S"""
  Get the type of kennitala.

      iex> Kennitala.type("1111111119")
      :individual
  """
  @spec type(String.t) :: :individual | :corporate
  def type(kennitala) do
    tokenized = tokenize(kennitala)
    if (validity(tokenized)) do
      case hd(tokenized) do
        x when x >= 4 -> :corporate
        _ -> :individual
      end
    end
  end

  defp tokenize(kennitala) do
    kennitala
      |> String.split("")
      |> Enum.filter(&(String.match?(&1, ~r/[\d]/)))
      |> Enum.map(&String.to_integer/1)
  end

  defp validity(kennitala) when is_binary(kennitala), do: validity(tokenize(kennitala))
  defp validity([_,_,_,_,_,_,_,_,vartala,_]=kennitala) do
    vartala == calc_vartala(kennitala)
  end
  defp validity(_), do: false

  defp calc_vartala(kennitala) do
    sum = Enum.zip(kennitala, @magic)
      |> Enum.map(fn {x, y} -> x * y end)
      |> Enum.reduce(fn(x, acc) -> x + acc end)
    leftover = rem(sum, 11)
    case 11 - leftover do
      10 -> :invalid
      11 -> 0
      x ->  x
    end
  end

  defp calc_date(e, i), do: e * 10 + i
  defp calc_date(e, i, 7), do: 1700 + calc_date(e, i)
  defp calc_date(e, i, 8), do: 1800 + calc_date(e, i)
  defp calc_date(e, i, 9), do: 1900 + calc_date(e, i)
  defp calc_date(e, i, 0), do: 2000 + calc_date(e, i)

end
