defmodule Oops.StringTest do
  use ExUnit.Case

  alias Oops.String
  import Oops.Sigils

  @string String.new("foo")

  test "methods" do
    assert @string.reverse.value == "oof"
    assert @string.upcase.value == "FOO"
    assert @string.match?(~r/oo/).value == true
    assert @string.ljust(5, ?-).value == "foo--"
  end

  test "chaining" do
    assert @string.reverse.upcase.value == "OOF"
  end

  test "sigil" do
    assert ~y/lolwat/ == String.new("lolwat")
  end
end
