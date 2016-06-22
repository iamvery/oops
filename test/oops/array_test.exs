defmodule Oops.ArrayTest do
  use ExUnit.Case

  alias Oops.Array

  @array Array.new([1,2,3])

  test "array is like enum and list" do
    assert @array.reverse.last.value == 1
  end
end
