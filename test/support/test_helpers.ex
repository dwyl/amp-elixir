defmodule Amp.TestHelpers do
  defp html_ext(name), do: name <> ".html"
  def md_ext_to_html(markdown_file) do
    markdown_file |> String.split(".") |> hd |> html_ext
  end

  def remove_white_space(html) do
    html
    |> String.split("\n")
    |> Enum.map(&(String.strip(&1)))
    |> Enum.join("\n")
  end

  defp read(type, file), do: File.read("test/fixtures/#{type}/#{file}")
  def read_markdown(file), do: read("markdown", file)
  def read_amp_html(file), do: read("amp_html", file)
end
