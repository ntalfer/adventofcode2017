defmodule Day5 do

  def solve(file) do
    file
    |> File.stream!([:utf8, :read], :line)
    |> Enum.map(&String.trim_trailing/1)
    |> Enum.map(&String.to_integer/1)
    |> do_solve(0, 0)
  end

  defp do_solve(list, index, steps) do
    case Enum.at(list, index) do
      nil ->
	steps
      elem ->
	{list1, [^elem|list2]} = Enum.split(list, index)
	new_list = list1 ++ [elem+1] ++ list2
	new_index = index + elem
	do_solve(new_list, new_index, steps+1)
    end
  end
end
