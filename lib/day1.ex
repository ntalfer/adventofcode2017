defmodule Day1 do

  def solve(digits) when is_binary(digits) do
    digits
    |> String.split("", [trim: true])
    |> Enum.map(&String.to_integer/1)
    |> solve
  end
  def solve([digit|_] = digits) do
    solve(digits, digit, 0)
  end

  defp solve([], _first, sum) do
    sum
  end
  defp solve([digit], first, sum) do
    if digit == first do
      sum + digit
    else
      sum
    end
  end
  defp solve([digit1, digit2 | digits], first, sum) do
    sum =
    if(digit1 == digit2) do
      sum + digit1
    else
      sum
    end
    solve([digit2] ++ digits, first, sum)
  end

end
