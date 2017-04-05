defmodule AmpTest do
  use ExUnit.Case
  import Amp.TestHelpers, only: [
    md_ext_to_html: 1,
    remove_white_space: 1,
    read_markdown: 1,
    read_amp_html: 1,
  ]

  test "Renders a h1 tag" do
    {:ok, html, []} = Amp.parse("# Hello World")
    assert html =~ "<h1>Hello World</h1>"
  end

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
