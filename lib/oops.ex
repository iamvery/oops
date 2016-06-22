defmodule Oops do
  defmacro __using__(like: module) do
    [constructor|[value_func|methods(module)]]
  end

  defp constructor do
    quote do
      def new(data), do: {__MODULE__, data}
    end
  end

  defp value_func do
    quote do
      def value({__MODULE__, data}), do: data
    end
  end

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
