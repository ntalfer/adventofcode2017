defmodule Day4 do

  def solve(file) do
    file
    |> File.stream!([:utf8, :read], :line)
    |> Enum.filter(&is_valid_passphrase/1)
    |> Enum.count
  end

  defp is_valid_passphrase(phrase) do
    wordlist = phrase |> String.split
    wordlist
    |> MapSet.new
    |> MapSet.size
    |> Kernel.==(Enum.count(wordlist))
  end
end
