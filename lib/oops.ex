defmodule Oops do
  defmacro __using__(_opts) do
    [constructor|[value_func]]
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
end
