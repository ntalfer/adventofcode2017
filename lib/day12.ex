defmodule Day12 do

  def solve() do
    solve("day12_input.txt")
  end

  def solve(file) do
    {:ok, _} = Tree.start_link()
    travel("0", file)
    size = Tree.size()
    Tree.stop()
    size
  end

  defp travel(leaf, file) do
    :os.cmd(to_charlist("grep '^#{leaf} ' #{file}"))
    |> to_string
    |> String.split(["#{leaf} <-> ", ",", " ", "\n"], trim: true)
    |> Enum.filter(fn leaf -> not Tree.member?(leaf) end)
    |> Enum.each(fn leaf -> 
      Tree.add_leaf(leaf)
      travel(leaf, file) 
    end) 
  end

end

defmodule Tree do

  def start_link do
    Agent.start_link(fn -> MapSet.new end, name: __MODULE__)
  end

  def member?(leaf) do
    Agent.get(__MODULE__, fn tree -> MapSet.member?(tree, leaf) end)
  end

  def add_leaf(leaf) do
    Agent.update(__MODULE__, fn tree -> MapSet.put(tree, leaf) end)
  end

  def size do
    Agent.get(__MODULE__, fn tree -> MapSet.size(tree) end)
  end 

  def stop, do: Agent.stop(__MODULE__)
   
end
