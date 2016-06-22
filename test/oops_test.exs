defmodule OopsTest do
  use ExUnit.Case
  doctest Oops

  defmodule Array do
    use Oops, like: Enum
  end

  test "array" do
    assert Array.new([1,2,3]).reverse.value == [3,2,1]
  end
end
