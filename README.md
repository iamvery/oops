# Oops

Accidentally I object-oriented programming, oops.

## Usage

You can use Oops to do terrible things that you shouldn't do.
For example, here's a string object, oops.

```elixir
iex> alias Oops.String
iex> String.new("dog").reverse.upcase.value
"GOD"
```

Maybe you hate functions, and you want something like an array, oops.

```elixir
iex> alias Oops.Array
iex> Array.new([1,2,3]).reverse.last.value
1
```

If that's not horrible enough to satisfy your appetite for awful things, make your own "objects", oops.

```elixir
defmodule Person do
  use Oops, properties: [:name]
  alias Oops.String

  defm :full_name do
    String.new(this.name)
  end

  defm :names do
    this.full_name.split.value
  end
end
```

Why are you still reading this?
Please don't use this library, it's a terrible thing! PLEASE!

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add oops to your list of dependencies in `mix.exs`:

        def deps do
          [{:oops, "~> 0.2.0"}]
        end
