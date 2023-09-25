defmodule Guesstheface.Service do
  @moduledoc "Module connecting the data store with the nation borders graph"
  alias Guesstheface.Nations
  alias Guesstheface.Store

  def pick do
    person = Store.pick()

    neighbor =
      person.nationality
      |> Nations.get_neighbors()
      |> Enum.random()

    Map.put(person, :wrong_nationality, neighbor)
  end
end
