defmodule Guesstheface.DataTests do
  use ExUnit.Case, async: true
  alias Guesstheface.Nations
  alias Guesstheface.Store

  describe "people" do
    test "all rows are correctly parsed" do
      errors = Enum.filter(Store.parse_csv(), fn {k, _} -> k != :ok end)
      assert errors == []
    end

    test "all people's nations are represented in the graph" do
      nations =
        Nations.all()
        |> Map.keys()
        |> MapSet.new()

      people =
        Store.parse_csv()
        |> Enum.map(fn {_, v} -> v["nationality"] end)
        |> MapSet.new()

      #     IO.inspect(MapSet.difference(people, nations))
      #     IO.inspect(MapSet.size(MapSet.difference(people, nations)))
      assert MapSet.subset?(people, nations)
    end
  end

  describe "nations" do
    test "the unions of the sets of keys and values are bijective" do
      keys =
        Nations.all()
        |> Map.keys()
        |> MapSet.new()

      values =
        Nations.all()
        |> Map.values()
        |> List.flatten()
        |> MapSet.new()

      assert MapSet.equal?(keys, values)
    end

    test "borders hold symmetry" do
      nations = Nations.all()

      nations
      |> Enum.each(fn {k, v} ->
        assert Enum.all?(v, fn v2 -> k in nations[v2] end)
      end)
    end
  end
end
