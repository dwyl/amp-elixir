# Amp Elixir

[![Build Status](https://travis-ci.org/dwyl/amp-elixir.svg?branch=master)](https://travis-ci.org/dwyl/amp-elixir)
[![codecov.io](https://codecov.io/github/dwyl/amp-elixir/coverage.svg?branch=master)](https://codecov.io/github/dwyl/amp?branch=master)
[![Hex version](https://img.shields.io/hexpm/v/amp.svg "Hex version")](https://hex.pm/packages/amp)

Amp transforms your Markdown into AMP-compliant html so it loads super-fast!

## Why?

Google is putting their clout behind the AMP (Accelerated Mobile Pages) Project to help speed up page load times on the Mobile Web: https://googleblog.blogspot.co.uk/2015/10/introducing-accelerated-mobile-pages.html

This module lets you convert Markdown (`.md`) files to AMP-compliant `.html` so that you can serve them up to mobile clients much faster.

## What?

For many, reading on the mobile web is a slow, clunky and frustrating experience - but it doesn’t have to be that way. The Accelerated Mobile Pages (AMP) Project is an open source initiative that embodies the vision that publishers can create mobile optimized content once and have it load instantly everywhere.

Read: https://www.ampproject.org/
How?

The best place to understand how AMP works is on the official "How it Works" page: https://www.ampproject.org/how-it-works/

## Documentation

Amp Elixir should support the same markdown as described in the [Earmark](https://github.com/pragdave/earmark) repository

For these limitations see: https://hexdocs.pm/earmark/Earmark.html#module-limitations

### Api

Amp.parse
+ `markdown` - (required) markdown string to be parsed
+ `options` - (required) map
  - headOverride - (optional) custom html head to use if you do not want to use one generated by ampl. Using this option will mean other options will have no effect
  - style - (optional) css string to style the output html
  - title - (optional) sets the title property in the page
  - canonicalUrl- (optional) sets the canonicalUrl of the page
  - extraHeadHTML- (optional) extra html to be inserted into the bottom of the head


## Background Reading

The AMP Spec: https://github.com/ampproject/amphtml

## Questions?

If you have any questions please ask: https://github.com/dwyl/ampl/issues

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `amp` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:amp, "~> 0.1.0"}]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/amp](https://hexdocs.pm/amp).

