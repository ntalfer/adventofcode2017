defmodule Day10 do

  def solve(input), do: solve(0..255, input)

  def solve(list, input) do
    pos = 0
    skip = 0
    do_solve(list, pos, skip, input)
  end

  defp do_solve([a,b|_], _, _, []) do
    a * b
  end
  defp do_solve(list, pos, skip, [length|lengths]) do
    if (pos + length > Enum.count(list)) do
      # splitting
      {_, ending_list} = Enum.split(list, pos)
      {starting_list, _} = Enum.split(list, length - (Enum.count(list) - pos))
      to_reverse_list = ending_list ++ starting_list
      reversed_list = Enum.reverse(to_reverse_list)
      {new_ending_list, new_starting_list} = Enum.split(reversed_list, Enum.count(ending_list))
      new_list = new_starting_list ++ Enum.slice(list, Enum.count(new_starting_list)..pos-1) ++ new_ending_list
      new_pos = rem(pos + length + skip, Enum.count(list))
      new_skip = skip + 1
      do_solve(new_list, new_pos, new_skip, lengths)
    else
      # no splitting
      {start_list, middle_end_list} = Enum.split(list, pos)
      {middle_list, end_list} = Enum.split(middle_end_list, length)
      reversed_list = Enum.reverse(middle_list)
      new_list = start_list ++ reversed_list ++ end_list
      new_pos = rem(pos + length + skip, Enum.count(list))
      new_skip = skip + 1
      do_solve(new_list, new_pos, new_skip, lengths)      
    end
  end
end
