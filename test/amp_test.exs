defmodule AmpTest do
  use ExUnit.Case

  test "Renders a h1 tag" do
    {:ok, html, []} = Amp.parse("# Hello World")
    assert html =~ "<h1>Hello World</h1>"
  end

  defp html_ext(name), do: name <> ".html"

  defp remove_white_space(html) do
    html
    |> String.split("\n")
    |> Enum.map(fn string -> String.strip(string) end)
    |> Enum.join("\n")
  end

  test "Fixtures" do
    "test/fixtures/markdown"
    |> File.ls
    |> elem(1)
    |> Enum.each(fn markdown_file ->
      amp_html_file = String.split(markdown_file, ".")
        |> hd
        |> html_ext

      {:ok, markdown} = File.read("test/fixtures/markdown/" <> markdown_file)

      {:ok, actual_html, []} = Amp.parse(markdown)
      {:ok, expected_html} = File.read("test/fixtures/amp_html/" <> amp_html_file)

      assert remove_white_space(actual_html) == remove_white_space(expected_html)
    end)
  end
end
