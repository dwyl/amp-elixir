defmodule Amp.Template do
  @moduledoc false
  def opening_tags do
    """
    <!DOCTYPE html>
    <html>
    <head>
    """
  end

  def head(html, opts) do
    cond do
      opts[:head_override] ->
        html <> opts[:head_override]
      true ->
        html <> """
        <meta charset="utf-8">
        <link rel="canonical" href="#{opts[:canonical_url] || ""}">
        <meta name="viewport"
          content="width=device-width,minimum-scale=1,initial-scale=1">
        <style amp-custom>
          #{opts[:style] || ""}
        </style>
        <style> body {opacity: 0} </style>
        <noscript>
          <style>body {opacity: 1} </style>
        </noscript>
        <script async src="https://cdn.ampproject.org/v0.js"></script>
        <title>#{opts[:title] || ""}</title>
        #{opts[:extra_head_html] || ""}
      """
    end
  end

  def closing_head_opening_body_tags(html) do
    html <> """
    </head>
    <body>
    """
  end

  def body(html, parsed_html) do
    html <> parsed_html
  end

  def closing_tags(html) do
    html <> """
    </body>
    </html>
    """
  end
end
