defmodule AmpTest do
  use ExUnit.Case
  import Amp.TestHelpers, only: [
    md_ext_to_html: 1,
    remove_white_space: 1,
    read_markdown: 1,
    read_amp_html_no_config: 1,
    read_amp_html_head_override: 1,
    read_amp_html_empty_opts: 1
  ]

  test "Renders a h1 tag" do
    {:ok, html, []} = Amp.parse("# Hello World")
    assert html =~ "<h1>Hello World</h1>"
  end

  describe "fixtures" do
    test "no config" do
      {:ok, markdown_files} = File.ls("test/fixtures/markdown")

      Enum.each(markdown_files, fn markdown_file ->
        # e.g.
        # markdown_file == hello_world.md
        # amp_html_file == hello_world.html

        amp_html_file = md_ext_to_html(markdown_file)

        {:ok, markdown} = read_markdown(markdown_file)

        {:ok, actual_html, []} = Amp.parse(markdown)
        {:ok, expected_html} = read_amp_html_no_config(amp_html_file)

        actual = remove_white_space(actual_html)
        expected = remove_white_space(expected_html)

        assert actual == expected
      end)
    end

    test "head_override" do
      {:ok, markdown_files} = File.ls("test/fixtures/markdown")

      Enum.each(markdown_files, fn markdown_file ->
        # e.g.
        # markdown_file == hello_world.md
        # amp_html_file == hello_world.html

        amp_html_file = md_ext_to_html(markdown_file)

        {:ok, markdown} = read_markdown(markdown_file)

        {:ok, actual_html, []} = Amp.parse(markdown, %{head_override: ""})
        {:ok, expected_html} = read_amp_html_head_override(amp_html_file)

        actual = remove_white_space(actual_html)
        expected = remove_white_space(expected_html)

        assert actual == expected
      end)
    end

    test "canonical_url, style, title, extra_head_html" do
      {:ok, markdown_files} = File.ls("test/fixtures/markdown")

      Enum.each(markdown_files, fn markdown_file ->
        # e.g.
        # markdown_file == hello_world.md
        # amp_html_file == hello_world.html

        amp_html_file = md_ext_to_html(markdown_file)

        {:ok, markdown} = read_markdown(markdown_file)

        opts =
          %{canonical_url: "",
            style: "",
            title: "",
            extra_head_html: ""
          }
        {:ok, actual_html, []} = Amp.parse(markdown, opts)
        {:ok, expected_html} = read_amp_html_empty_opts(amp_html_file)

        actual = remove_white_space(actual_html)
        expected = remove_white_space(expected_html)

        assert actual == expected
      end)
    end
  end
end
