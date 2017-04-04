defmodule AmpTest do
  use ExUnit.Case
  doctest Amp

  test "Renders a h1 tag" do
    assert Amp.parse("# Hello World") == {:ok, "<h1>Hello World</h1>\n", []}
  end
end
