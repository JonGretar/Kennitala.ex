defmodule Kennitala do

  @magic [3, 2, 7, 6, 5, 4, 3, 2];

  @doc ~S"""
  Check legality of kennitala

    iex> Kennitala.valid?("1111111119")
    true
  """
  @spec valid?(String.t) :: Boolean.t
  def valid?(kennitala) when is_binary(kennitala), do: valid?(tokenize(kennitala))
  def valid?(kennitala) when is_list(kennitala) and length(kennitala) == 10 do
    kennitala |> validity
  end
  def valid?(_), do: false

  @doc ~S"""
  Get the type of kennitala

    iex> Kennitala.get_birthdate("0102031129")
    {1903, 2, 1}
  """
  def get_birthdate(kennitala) when is_binary(kennitala), do: get_birthdate(tokenize(kennitala))
  def get_birthdate([d1,d2,m1,m2,y1,y2,_,_,_,c] = kennitala) when d1 >= 4 do
    if valid?(kennitala) do
      {calc_date(y1, y2, c), calc_date(m1, m2), calc_date(d1 - 4, d2)}
    end
  end
  def get_birthdate([d1,d2,m1,m2,y1,y2,_,_,_,c] = kennitala) do
    if valid?(kennitala) do
      {calc_date(y1, y2, c), calc_date(m1, m2), calc_date(d1, d2)}
    end
  end
  def get_birthdate(kennitala), do: nil


  @doc ~S"""
  Get the type of kennitala

    iex> Kennitala.type("1111111119")
    :individual
  """
  @spec valid?(String.t) :: :individual | :corporate
  def type(kennitala) do
    tokenized = tokenize(kennitala)
    if (valid?(tokenized)) do
      case hd(tokenized) do
        x when x >= 4 -> :corporate
        _ -> :individual
      end
    end
  end

  defp tokenize(kennitala) do
    kennitala
      |> String.split("")
      |> Enum.reject(&(&1 in [""]))
      |> Enum.reject(&(String.match?(&1, ~r/[^\d]/)))
      |> Enum.map(&String.to_integer/1)
  end

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
