defmodule AmpTest do
  use ExUnit.Case

  test "Renders a h1 tag" do
    {:ok, html, []} = Amp.parse("# Hello World") 
    assert html =~ "<h1>Hello World</h1>"
  end
end
