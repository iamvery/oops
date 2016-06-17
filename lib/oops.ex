defmodule Oops do
  defmacro __using__(like: module) do
    {module, _} = Code.eval_quoted(module)
    [constructor|[value_func|methods(module)]]
  end

  defp constructor do
    quote do
      def new(str), do: {__MODULE__, str}
    end
  end

  defp value_func do
    quote do
      def value({__MODULE__, str}), do: str
    end
  end

  defp methods(module) do
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
