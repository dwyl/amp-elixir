defmodule AmpTest do
  use ExUnit.Case

  test "Renders a h1 tag" do
    {:ok, html, []} = Amp.parse("# Hello World")
    assert html =~ "<h1>Hello World</h1>"
  end

  defp html_ext(name), do: name <> ".html"

  defp md_ext_to_html(markdown_file) do
    String.split(markdown_file, ".") |> hd |> html_ext
  end

  defp remove_white_space(html) do
    html
    |> String.split("\n")
    |> Enum.map(fn string -> String.strip(string) end)
    |> Enum.join("\n")
  end

  test "Fixtures" do
    {:ok, markdown_files} = File.ls("test/fixtures/markdown")

    Enum.each(markdown_files, fn markdown_file ->
      # e.g.
      # markdown_file == hello_world.md
      # amp_html_file == hello_world.html

      amp_html_file = md_ext_to_html(markdown_file)

      {:ok, markdown} = File.read("test/fixtures/markdown/" <> markdown_file)

      {:ok, actual_html, []} = Amp.parse(markdown)
      {:ok, expected_html} = File.read("test/fixtures/amp_html/" <> amp_html_file)

      assert remove_white_space(actual_html) == remove_white_space(expected_html)
    end)
  end
end
