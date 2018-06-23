defmodule Exsolr.Schema do
  @moduledoc """
  Provides schema functions to Solr
  """

  require Logger

  alias Exsolr.Config
  alias Exsolr.HttpResponse

  def get do
    Config.schema_url()
    |> HTTPoison.get
    |> HttpResponse.body
    |> extract_response()
  end

  @doc """
  Post a string of JSON data to the schema
  """
  def post(data) do
    Config.schema_url()
    |> HTTPoison.post(data)
    |> HttpResponse.body
  end

  defp extract_response(solr_response) do
    {:ok, %{"schema" => schema}} = solr_response |> Poison.decode
    schema
  end
end
