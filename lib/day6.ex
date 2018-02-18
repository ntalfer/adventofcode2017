defmodule Day6 do

  def solve(list) do
    do_solve(list, [])
  end

  defp do_solve(list, states) do
    case Enum.member?(states, list) do
      true ->
	Enum.count(states)
      false ->
	new_list = reallocate(list)	
	do_solve(new_list, states ++ [list])
    end	
  end

  defp reallocate(list) do
    {index, value} = get_max_value_with_index(list, 0, {-1, -1})
    {list1, [^value|list2]} = Enum.split(list, index)
    new_list = list1 ++ [0] ++ list2
    new_index = rem(index+1, Enum.count(list))
    do_reallocate(new_list, new_index, value)
  end

  defp do_reallocate(list, _index, 0) do
    list
  end
  defp do_reallocate(list, index, amount) do
    {list1, [elem|list2]} = Enum.split(list, index)
    new_list = list1 ++ [elem+1] ++ list2
    new_index = rem(index+1, Enum.count(list))
    do_reallocate(new_list, new_index, amount-1)
  end

  defp get_max_value_with_index([], _cursor, {index, value}) do
    {index, value}
  end
  defp get_max_value_with_index([elem|rest], cursor, {_index, value}) when elem > value do
    get_max_value_with_index(rest, cursor+1, {cursor, elem})
  end
  defp get_max_value_with_index([_elem|rest], cursor, {index, value}) do
    get_max_value_with_index(rest, cursor+1, {index, value})
  end

end
