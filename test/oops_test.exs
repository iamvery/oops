defmodule OopsTest do
  use ExUnit.Case
  doctest Oops

  defmodule Foo do
    use Oops
  end

  test "initialization" do
    assert Foo.new("lolwat") == Foo.new("lolwat")
  end

  test "value" do
    foo = Foo.new("lolwat")
    assert foo.value == "lolwat"
  end
end
