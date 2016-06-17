defmodule OopsTest do
  use ExUnit.Case
  doctest Oops

  defmodule Stringy do
    use Oops
  end

  test "constructor and value" do
    assert Stringy.new("foo").value == "foo"
  end
end
