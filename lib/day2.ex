defmodule Day2 do

  def solve(input) when is_binary(input) do
    input
    |> String.split("\n")
    |> Enum.map(&(row_checksum(&1)))
    |> Enum.reduce(&(&1 + &2))
  end

  defp row_checksum(row) when is_binary(row) do
    row
    |> String.split()
    |> Enum.map(&String.to_integer/1)
    |> row_checksum()
  end
  defp row_checksum(row) do
    Enum.max(row) - Enum.min(row)
  end

end
