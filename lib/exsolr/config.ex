defmodule Exsolr.Config do
  @moduledoc """
  Access the Exsolr configurations
  """

  @doc """
  Returns a map containing the solr connection info

  ## Examples

      iex> Exsolr.Config.info()
      %{hostname: "localhost", port: 8983, core: "elixir_test"}
  """
  def info() do
    %{
      hostname: hostname(),
      port: port(),
      core: core()
    }
  end

  def hostname(), do: Application.get_env(:exsolr, :hostname)
  def port(), do: Application.get_env(:exsolr, :port)
  def core(), do: Application.get_env(:exsolr, :core)

  @doc """
  Returns the base url to do `select` queries to solr

  ## Examples

      iex> Exsolr.Config.select_url
      "http://localhost:8983/solr/elixir_test/select"

  """
  def select_url(), do: "#{base_url()}/select"

  @doc """
  Returns the base url to do `update` queries to solr

  ## Examples

      iex> Exsolr.Config.update_url
      "http://localhost:8983/solr/elixir_test/update"
  """
  def update_url(), do: "#{base_url()}/update"

  @doc """
  Returns the base url to interact with the solr schema api

  ## Examples

      iex> Exsolr.Config.schema_url
      "http://localhost:8983/solr/elixir_test/schema"
  """
  def schema_url(), do: "#{base_url()}/schema"

  defp base_url(), do: "#{hostname()}:#{port()}/solr/#{core()}"
end
