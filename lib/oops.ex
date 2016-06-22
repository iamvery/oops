defmodule Oops do
  alias Oops.Modules

  @default_properties [:value]

  defmacro __using__(opts) do
    module = opts[:like] |> Modules.normalize
    properties = opts[:properties] || @default_properties
    [constructor(properties)] ++ getters(properties) ++ methods(module)
  end

  defmacro defm(name, do: body) do
    quote do
      def unquote(name)(var!(this)) do
        unquote(body)
      end
    end
  end

  defp constructor(properties) do
    vars = properties |> length |> generate_vars
    quote do
      import Oops
      def new(unquote_splicing(vars)), do: {__MODULE__, unquote_splicing(vars)}
    end
  end

  defp getters(properties) do
    for {property, index} <- Enum.with_index(properties) do
      quote do
        def unquote(property)(data) do
          elem(data, unquote(index)+1)
        end
      end
    end
  end

  defp methods(nil), do: []
  defp methods(module) do
    {module, _} = Code.eval_quoted(module)
    for {name, arity} <- module.__info__(:functions) do
      vars = generate_vars(arity-1)
      quote do
        def unquote(name)(unquote_splicing(vars), {__MODULE__, value}) do
          {__MODULE__, unquote(module).unquote(name)(value, unquote_splicing(vars))}
        end
      end
    end
  end

  defp generate_vars(0), do: []
  defp generate_vars(count) do
    for index <- 1..count, do: Macro.var(:"var#{index}", __MODULE__)
  end
end
