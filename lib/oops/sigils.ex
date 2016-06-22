defmodule Oops.Sigils do
  def sigil_y(term, _modifiers) do
    Oops.String.new(term)
  end
end
