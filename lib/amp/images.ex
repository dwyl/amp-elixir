defmodule Amp.Images do
  @moduledoc false
  def parse_images(html, _opts) do
    html
    |> String.split("<img")
    |> Enum.join("<amp-img")
  end
end
