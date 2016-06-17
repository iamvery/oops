defmodule OopsTest do
  use ExUnit.Case
  doctest Oops

  defmodule Stringy do
    use Oops, like: String
  end

  test "constructor and value" do
    assert Stringy.new("foo").value == "foo"
  end

  @string Stringy.new("foo")

  test "methods" do
    assert @string.reverse.value == "oof"
    assert @string.upcase.value == "FOO"
    assert @string.match?(~r/oo/).value == true
    assert @string.ljust(5, ?-).value == "foo--"
  end

  test "chaining" do
    assert @string.reverse.upcase.value == "OOF"
  end

  defmodule Array do
    use Oops, like: Enum
  end

  test "array" do
    assert Array.new([1,2,3]).reverse.value == [3,2,1]
  end
end
