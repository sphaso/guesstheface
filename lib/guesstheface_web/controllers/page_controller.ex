defmodule GuessthefaceWeb.PageController do
  use GuessthefaceWeb, :controller
  alias Guesstheface.Service

  def home(conn, _params) do
    guess =
      Service.pick()
      |> Map.update!(:nationality, &nation_transformer/1)
      |> Map.update!(:wrong_nationality, &nation_transformer/1)

    render(conn, :home, guess: guess)
  end

  def about(conn, _params) do
    render(conn, :about)
  end

  defp nation_transformer(nation) do
    nation
    |> String.split("_")
    |> Enum.map_join(" ", &String.capitalize/1)
  end
end
