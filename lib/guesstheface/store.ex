defmodule Guesstheface.Store do
  @moduledoc "GenServer storing the game data"
  use GenServer

  def start_link(arg) do
    GenServer.start_link(__MODULE__, arg, name: __MODULE__)
  end

  @impl true
  def init(_) do
    {:ok, %{}, {:continue, :get_list}}
  end

  def parse_csv() do
    "../../priv/wd_people.csv"
    |> Path.expand(__DIR__)
    |> File.stream!([:trim_bom])
    |> CSV.decode(separator: ?\t, headers: true)
    |> Enum.into([])
  end

  @impl true
  def handle_continue(:get_list, _) do
    state = parse_csv()
    {:noreply, state}
  end

  @impl true
  def handle_call(:pick, _from, state) do
    lucky = Enum.random(0..length(state))
    {:ok, row} = Enum.at(state, lucky)

    {:reply,
     %{
       id: row["id"],
       nationality: row["nationality"],
       image: row["image"]
     }, state}
  end

  def pick() do
    GenServer.call(__MODULE__, :pick)
  end
end
