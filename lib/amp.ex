defmodule Amp do
  @moduledoc """
  Documentation for Amp.
  """

  alias Amp.{Template, Images}
  alias Earmark.Options

  def parse(md, opts \\ %{}) do
    case Earmark.as_html(md, struct(Options, opts[:earmark_opts] || %{})) do
      {:ok, parsed_html, []} ->
        amp_html =
          Template.opening_tags()
          |> Template.head(opts)
          |> Template.closing_head_opening_body_tags()
          |> Template.body(parsed_html)
          |> Template.closing_tags()
          |> Images.parse_images(opts)
        {:ok, amp_html, []}
      {:error, _, errors} ->
        {:error, errors}
    end
  end
end
