defmodule AmpTest do
  use ExUnit.Case
  import Amp.TestHelpers

  test "Renders a h1 tag" do
    {:ok, html, []} = Amp.parse("# Hello World")
    assert html =~ "<h1>Hello World</h1>"
  end

  # defp html_ext(name), do: name <> ".html"

  defp md_ext_to_html(markdown_file) do
    String.split(markdown_file, ".") |> hd |> html_ext
  end

  defp remove_white_space(html) do
    html
    |> String.split("\n")
    |> Enum.map(&(String.strip(&1)))
    |> Enum.join("\n")
  end

  defp read(type) do
    fn file ->
      File.read("test/fixtures/#{type}/#{file}")
    end
  end

  defp read_markdown(file), do: read("markdown").(file)
  defp read_amp_html(file), do: read("amp_html").(file)

  test "Fixtures" do
    {:ok, markdown_files} = File.ls("test/fixtures/markdown")

    Enum.each(markdown_files, fn markdown_file ->
      # e.g.
      # markdown_file == hello_world.md
      # amp_html_file == hello_world.html

      amp_html_file = md_ext_to_html(markdown_file)

      {:ok, markdown} = read_markdown(markdown_file)

      {:ok, actual_html, []} = Amp.parse(markdown)
      {:ok, expected_html} = read_amp_html(amp_html_file)

      actual = remove_white_space(actual_html)
      expected = remove_white_space(expected_html)

      assert actual == expected
    end)
  end
end
