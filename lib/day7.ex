defmodule Program do
  defstruct [:name, :weight, :above]
end

defmodule Day7 do

  def solve() do
    programs = 
      "day7_input.txt"
      |> File.stream!([:read, :utf8])
      |> Enum.map(&to_program/1)
      |> unleaf
  end

  def unleaf([%Program{name: name}]) do
    name
  end
  def unleaf(programs) do
    leaf = get_leaf(programs)
    programs
    |> Kernel.--([leaf])
    |> Enum.map(fn p -> unleaf(p, leaf) end)
    |> unleaf
  end

  def unleaf(%Program{above: above} = p, leaf) do
    %Program{p | above: above -- [leaf.name]}
  end

  def get_leaf([]), do: :no_leaf
  def get_leaf([%Program{above: []} = p|_]) do
    p
  end
  def get_leaf([_p|programs]), do: get_leaf(programs)

  defp to_program(line) do
    #fwft (72) -> ktlj, cntj, xhth
    #qoyq (66)
    above =
      case String.split(line, " -> ") do
	[_] -> []
	[_, names] -> String.split(names, [",", "\n", " "], trim: true)
      end
    [name|_] = String.split(line)
    [_, weight, _] = String.split(line, ["(", ")"])
    %Program{name: name, weight: String.to_integer(weight), above: above}
  end
end


