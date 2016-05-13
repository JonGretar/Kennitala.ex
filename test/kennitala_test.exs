defmodule KennitalaTest do
  use ExUnit.Case
  doctest Kennitala

  test "validity" do
    assert Kennitala.valid?("3108962099") === true
    assert Kennitala.valid?("1111111119") === true
    assert Kennitala.valid?("6503760649") === true
  end

  test "invalidity" do
    assert Kennitala.valid?("010101") === false
    assert Kennitala.valid?("Some funky shit") === false
    assert Kennitala.valid?("1709715049") === false
    assert Kennitala.valid?([:a, :b, :c]) === false
  end

  test "removal of non-numeric characters" do
    assert Kennitala.valid?("111111-1119") === true
    assert Kennitala.valid?("111111_1119") === true
    assert Kennitala.valid?("111111 1119") === true
    assert Kennitala.valid?(" 1111111119 ") === true
  end

  test "type checking" do
    assert Kennitala.type("1111111119") === :individual
    assert Kennitala.type("6503760649") === :corporate
  end

  test "birthday calculation" do
    assert Kennitala.get_birthdate("0101011159") === {1901, 1, 1}
    assert Kennitala.get_birthdate("3112991150") === {2099, 12, 31}
    assert Kennitala.get_birthdate("6503760648") === {1876, 3, 25}
    assert Kennitala.get_birthdate("6503760647") === {1776, 3, 25}
  end

end
