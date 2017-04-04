defmodule Amp do
  @moduledoc """
  Documentation for Amp.
  """

  @doc """
  `parse`

  ## Examples

      iex> Amp.parse("# Hello World")
      {:ok, "<h1>Hello World</h1>\\n", []}

  """
  def parse(md) do
    Earmark.as_html(md)
  end
end
