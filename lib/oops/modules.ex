defmodule Oops.Modules do
  @doc """
      iex> Oops.Modules.normalize(quote(do: Foo))
      Foo
  """
  def normalize(modules) do
    modules
    |> eval_quoted
  end

  defp eval_quoted(module) do
    module
    |> Code.eval_quoted
    |> elem(0)
  end
end
