defmodule Pokefight.Api.Pokemon do
  @pokeapi_host Application.get_env(:pokefight, :pokeapi_host)

  require Logger

  def get_pokemon(pokename) do
    get("pokemon/#{pokename}")
  end

  def get_moves(pokename) do
    {:ok, pokemon} = get_pokemon(pokename)

    pokemon["moves"]
  end

  def get(endpoint) do
    process_response(HTTPoison.get("#{@pokeapi_host}#{endpoint}"))
  end

  defp process_response({:ok, %HTTPoison.Response{status_code: 200, body: body}}) do
    {:ok, Poison.decode!(body)}
  end

  defp process_response({:ok, %HTTPoison.Response{status_code: status_code, body: body}}) do
    Logger.info("PokeApi response error: #{body}")

    case status_code do
      400 -> {:error, "bad_request"}
      401 -> {:error, "unauthorized"}
      403 -> {:error, "forbidden"}
      404 -> {:error, "not_found"}
      500 -> {:error, "internal_server_error"}
      _ -> {:error, "unexpected_error"}
    end
  end

  defp process_response({:error, _}) do
    {:error, "PokeApi integration problem"}
  end
end
