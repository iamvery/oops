defmodule ArrayTest do
  use ExUnit.Case

  alias Oops.Array

  @array Array.new([1,2,3])

  test "array" do
    assert @array.reverse.value == [3,2,1]
  end
end